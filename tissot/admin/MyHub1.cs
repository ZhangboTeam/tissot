using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace tissot.admin
{
    public class connadmin
    {
        public static bool CountBonusByDateAndAmount(string adminname, string password)
        {

            int conn = (int)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select count(1) from admin where adminname=@admin and password=@password",
                 new System.Data.SqlClient.SqlParameter("@adminname", adminname),
                 new System.Data.SqlClient.SqlParameter("@password", password)

                );
            if (conn == 1)
            {

                System.Web.HttpContext.Current.Session["UserName"] = adminname;
                return true;
            }
            else
            {
                return false;
            }
        }
    }

}