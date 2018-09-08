using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net;
using System.Linq;
using System.Web.Providers.Entities;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using SACCOPortal.NavOData;
using System.IO;
using System.Drawing;

namespace SACCOPortal
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
            new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                ConfigurationManager.AppSettings["DOMAIN"])
        };
        protected void Page_Load(object sender, EventArgs e)
        {
          if (Session["username"] != null)
            {
                ReturnMember();
                LoadProfPic();
            }
            HttpContext.Current.Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            HttpContext.Current.Response.Cache.SetValidUntilExpires(false);
            HttpContext.Current.Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoStore();
        }
        protected Member ReturnMember()
        {
            return new Member(Session["username"].ToString());
        }

        protected void LoadProfPic()
        {
            //string mystr = "";
            //WSConfig.ObjNav.Fngetpicture(Session["username"].ToString(), ref mystr);

            //byte[] bytes = Convert.FromBase64String(mystr);

            //Image image;
            //using (System.IO.MemoryStream ms = new MemoryStream(bytes))
            //{
            //    profPic.  = System.Drawing.Image.FromStream(ms);
            //}
                       
            try
            {
                string mystr = "";
                WSConfig.ObjNav.Fngetpicture(Session["username"].ToString(), ref mystr);

                byte[] buffer = Convert.FromBase64String(mystr);
                FileStream file = File.Create("D:\\portals\\Kingdom\\saccoportal\\ProfilePics\\" + Session["username"].ToString() + ".jpg");
                file.Write(buffer, 0, buffer.Length);
                file.Close();


                if (mystr == null)
                {
                    SACCOFactory.ShowAlert("Upload a profile picture");
                }
                else
                {
                    profPic1.ImageUrl = "ProfilePics/" + Session["username"].ToString()+".jpg";
                    profPic.ImageUrl = "ProfilePics/" + Session["username"].ToString()+".jpg";                   
                    HttpResponse.RemoveOutputCacheItem("/Dashboard.aspx");
                }
            }
            catch (Exception ex)
            { 
                ex.Data.Clear();
            }

            //try
            //{
            //var pic  = WSConfig.ObjNav.FnSavePics(Session["username"].ToString(), "");
            //    var pic =
            //    nav.profile_Pics.ToList()
            //        .Where(sn => sn.Customer_Number == Session["username"].ToString())
            //        .Select(l => l.Pic_Name)
            //        .SingleOrDefault();

            //    if (pic == null)
            //    {
            //        // SACCOFactory.ShowAlert("Upload a profile picture");
            //    }
            //    else
            //    {
            //        profPic.ImageUrl = "ProfilePics/" + pic;
            //        profPic1.ImageUrl = "ProfilePics/" + pic;
            //        HttpResponse.RemoveOutputCacheItem("/Dashboard.aspx");
            //    }
            //}
            //catch (Exception ex)
            //{


            //}

        }
    }

}