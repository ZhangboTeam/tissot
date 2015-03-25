using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tissot.admin
{
    

    public partial class adminconn : System.Web.UI.Page
    {

        //DataSet ds;
        //SqlDataAdapter dr;
        //SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
         //   if (!IsPostBack)
         //{
         //    string strconn = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ToString();
         //    SqlConnection con = new SqlConnection(strconn);
         //    con.Open();
         //    com = new SqlCommand();
         //    com.Connection = con;
         //    com.CommandText = "select count(*) from userinfo";
         //    AspNetPager1.AlwaysShow = true;
         //    AspNetPager1.PageSize = 5;
         //    AspNetPager1.RecordCount = (int)com.ExecuteScalar();
         //    con.Close();
         //    RepeaterDataBind();
         //}

        }
     //   private void RepeaterDataBind()
     //{
     //    string strconn = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ToString();
     //    dr = new SqlDataAdapter("select * from userinfo", strconn);
     //    ds = new DataSet();
     //    dr.Fill(ds, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize, "userinfo");
     //    this.Repeater1.DataSource = ds.Tables["userinfo"];
     //    this.Repeater1.DataBind();

     //}

     //protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
     //{
     //    AspNetPager1.CurrentPageIndex = e.NewPageIndex;
     //    RepeaterDataBind();
     //}
     //protected string FormatString_Size_13(string str)
     //{
     //    if (str.Length > 33)
     //    {
     //        str = str.Substring(0, 32) + "";
     //    }
     //    return str;
     //}

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //string adminname = TextBox1.Text.ToString();
        //    //string password = TextBox2.Text.ToString();
        //    //bool ok=tissot.SystemDAO.SqlHelper.Exists("select count(1) from admin where adminname=@adminname and password= @Password",
        //    //    new System.Data.SqlClient.SqlParameter("@adminname", adminname),
        //    //    new System.Data.SqlClient.SqlParameter("@Password", password));
        //    //if (ok)
        //    //{
        //    //    Response.Redirect("/admin/Serch.aspx");
        //    //}
        //}
    }
}