using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tissot
{
    public partial class Serch : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //        BindStudent();
        //}

        //private void BindStudent()
        //{
        //    string str = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        //    using (SqlConnection sqlCnn = new SqlConnection(str))
        //    {
        //        using (SqlDataAdapter da = new SqlDataAdapter("select * from userinfo", sqlCnn))
        //        {
        //            DataSet ds = new DataSet();
        //            da.Fill(ds);
        //            this.Repeater1.DataSource = ds;
        //            this.Repeater1.DataBind();
        //        }
        //    }
        //}

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}