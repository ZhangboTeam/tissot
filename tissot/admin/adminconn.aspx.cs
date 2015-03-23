using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tissot.admin
{
    public partial class adminconn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string adminname = TextBox1.Text.ToString();
            string password = TextBox2.Text.ToString();
            bool ok=tissot.SystemDAO.SqlHelper.Exists("select count(1) from admin where adminname=@adminname and password= @Password",
                new System.Data.SqlClient.SqlParameter("@adminname", adminname),
                new System.Data.SqlClient.SqlParameter("@Password", password));
            if (ok)
            {
                Response.Redirect("/admin/Serch.aspx");
            }
        }
    }
}