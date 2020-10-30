using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace presentationWeb
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup  
            Application["TotalOnlineUsers"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started  
            Application.Lock();
            Application["TotalOnlineUsers"] = (int)Application["TotalOnlineUsers"] + 1;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends.   
            // Note: The Session_End event is raised only when the sessionstate mode  
            // is set to InProc in the Web.config file. If session mode is set to StateServer   
            // or SQLServer, the event is not raised.  
            Application.Lock();
            Application["TotalOnlineUsers"] = (int)Application["TotalOnlineUsers"] - 1;
            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown  
        }
    }
}