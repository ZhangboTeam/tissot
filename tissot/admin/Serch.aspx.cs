using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tissot
{

    public partial class Serch : System.Web.UI.Page
    {
        //const string cacheKey = "ordersTable";
        protected void Page_Load(object sender, EventArgs e)
        {
        //    if (!IsPostBack)
        //    {
        //        DataTable tbl = loadFromXMLOrCache();
        //        AspNetPager1.RecordCount = tbl.Rows.Count;
        //    }
        //}

        //DataTable loadFromXMLOrCache()
        //{
        //    DataTable tbl = (DataTable)Cache[cacheKey];
        //    if (null == tbl)
        //    {
        //        string xmlFile = Server.MapPath("~/tissot/bin/AspNetPager.XML");
        //        tbl = new DataTable();
        //        tbl.ReadXml(xmlFile);
        //        CacheDependency dep = new CacheDependency(xmlFile);
        //        Cache.Insert(cacheKey, tbl, dep);
        //    }
        //    return tbl;
    

        //protected void AspNetPager1_PageChanged(object src, EventArgs e)
        //{
        //    DataTable tbl = loadFromXMLOrCache();
        //    if (tbl != null && tbl.Rows.Count > 0)
        //    {
        //        DataView dv = tbl.DefaultView;
        //        dv.Sort = "orderid desc";
        //        DataTable srcTbl = tbl.Clone();
        //        for (int i = AspNetPager1.StartRecordIndex; i <= AspNetPager1.EndRecordIndex; i++)
        //        {
        //            srcTbl.ImportRow(dv[i - 1].Row);
        //        }
        //        Repeater1.DataSource = srcTbl;
        //        Repeater1.DataBind();
        //    }

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

           
        //}
        }
         protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
            {

            }
    }
}