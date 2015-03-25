using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tissot
{
    public partial class Inserturl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        //    tissot.SystemDAO.SqlHelper.ExecteNonQueryText("insert into uurl(name,city) values (@name,@url)",
        //          new System.Data.SqlClient.SqlParameter("@name", name),
        //          new System.Data.SqlClient.SqlParameter("@url", url));
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        { 
               
                string name=TextBox1.Text.ToString();
                string url = TextBox2.Text.ToString();
                var sql = string.Format("select count(*) from uurl where name='{0}'", name);
                var sql1 = string.Format("select count(*) from uurl where name='{0}'", url);
                var exists = tissot.SystemDAO.SqlHelper.Exists(sql);
                var exists1 = tissot.SystemDAO.SqlHelper.Exists(sql1);
                if (name == "" || url == "")
                {
                    Response.Write("<script>alert('值不能为空.')</script>");
                    
                }
                else if (exists||exists1)
                {
                    Response.Write("<script>alert('插入重复.')</script>");

                }
                else
                {
                    
                    SystemDAO.SqlHelper.ExecteNonQueryText("insert into uurl(name,url) values (@name,@url)",
                      new System.Data.SqlClient.SqlParameter("@name", name),
                      new System.Data.SqlClient.SqlParameter("@url", url));
                    Response.Write("<script>alert('插入成功.')</script>");
                }
        }
    }
}