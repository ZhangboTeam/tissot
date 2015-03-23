<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Serch.aspx.cs" Inherits="tissot.Serch" %>


<script runat="server"> 

    private string ky = "";
    private int totalCount;
    private int totalCount2;
    private int totalCount50;
    private int totalOpenId;
    private double totalMoney;

    //protected override void OnLoad(EventArgs e)
    //{
    //    base.OnLoad(e);
    //    ky = this.Request["key"];
    //    if (!IsPostBack)
    //    {
    //        this.LoadData();
    //        AspNetPager1.RecordCount = totalCount;
    //        //bindData(); //使用url分页，只需在分页事件处理程序中绑定数据即可，无需在Page_Load中绑定，否则会导致数据被绑定两次
    //    }
    //}

    private System.Data.SqlClient.SqlDataReader LoadData()
    {
        var key = new System.Data.SqlClient.SqlParameter("@ky", ky == null ? "" : ky);
        var key2 = new System.Data.SqlClient.SqlParameter("@ky", ky == null ? "" : ky);
        var sptotalCount = new System.Data.SqlClient.SqlParameter("@totalCount",  System.Data.SqlDbType.Int) { Direction = System.Data.ParameterDirection.Output,Size=4  };
        var sptotalCount2 = new System.Data.SqlClient.SqlParameter("@totalCount2",  System.Data.SqlDbType.Int) { Direction = System.Data.ParameterDirection.Output,Size=4  };
        var sptotalCount50 = new System.Data.SqlClient.SqlParameter("@totalCount5",  System.Data.SqlDbType.Int) { Direction = System.Data.ParameterDirection.Output,Size=4  };
        var sptotalOpenId = new System.Data.SqlClient.SqlParameter("@totalOpenId", System.Data.SqlDbType.Int) { Direction = System.Data.ParameterDirection.Output ,Size=4 };
        var sptotalMoney = new System.Data.SqlClient.SqlParameter("@totalMoney", System.Data.SqlDbType.Float) { Direction = System.Data.ParameterDirection.Output,Size=4  };

        //var dr =   iMidudu.SystemDAO.SqlHelper.ExecuteReaderFromStoredProcedure(  "usp_UserSearch",
        //   new System.Data.SqlClient.SqlParameter("@ky", ky==null?"" :ky),
        //   new System.Data.SqlClient.SqlParameter("@startIndex", AspNetPager1.StartRecordIndex),
        //   new System.Data.SqlClient.SqlParameter("@endIndex", AspNetPager1.EndRecordIndex),
        //   sptotalCount,sptotalCount2,sptotalCount5,sptotalOpenId,sptotalMoney
        //   );

        var cmd = new System.Data.SqlClient.SqlCommand();
        var cn = new System.Data.SqlClient.SqlConnection(System.Web.Configuration.WebConfigurationManager.AppSettings["con"]);
        cmd.Connection = cn;
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        //cmd.CommandText = "usp_UserSearch";
        //cmd.Parameters.AddRange(new System.Data.SqlClient.SqlParameter[] {key2
        //     ,
        //   new System.Data.SqlClient.SqlParameter("@startIndex", AspNetPager1.StartRecordIndex),
        //   new System.Data.SqlClient.SqlParameter("@endIndex", AspNetPager1.EndRecordIndex),
        //   sptotalCount,sptotalCount2,sptotalCount50,sptotalOpenId,sptotalMoney
        //});
        cn.Open();
        var dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        this.totalCount = (int)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  count(*) from userinfo where username like '%' + @ky + '%'", key);
        this.totalCount2 = (int)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  count(*) from userinfo  where username like '%' + @ky + '%' and Amount=2;", key);
        this.totalCount50 = (int)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  count(*) from userinfo  where username like '%' + @ky + '%' and Amount=50;", key);
        this.totalOpenId = (int)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  count(distinct([OpenId] )) from userinfo  where username like '%' + @ky + '%' ", key);
        this.totalMoney = (double)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  SUM(amount) from userinfo  where username like '%' + @ky + '%' ", key);
        return dr;
    }
    public override void DataBind()
    {
        this.Repeater1.DataSource = this.LoadData();
        base.DataBind();

    }


    protected void AspNetPager1_PageChanged(object src, EventArgs e)
    {
        this.DataBind();
    }
</script>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理员登录</title>
    <style type="text/css">
        .auto-style2 {
            font-weight: bold;
            height: 22px;
            color: #003E49;
            cursor: pointer;
            border: 1px solid #30B0C8;
            padding: 0 10px;
            background: #D0D1D4 url('http://localhost:5906/Admin/images/btn_submit_2.png') repeat-x;
        }
        .auto-style3 {
            text-align: center;
            width: 671px;
        }
    </style>
</head>
<body style="height: 519px; width: 472px">
    <form id="form1" runat="server">
        <div class="auto-style3">
        管理员管理</div>
        <div style="height: 202px; width: 899px; margin-top: 6px;">
     <input type="text" placeholder="二维码编号" name="Code">
    <input class="auto-style2" 
        style="-webkit-box-shadow: 0 1px 0 #fff;
        -moz-box-shadow: 0 1px 0 #fff; box-shadow: 0 1px 0 #fff;
         -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px;
          text-shadow: 0 1px 0 #6CDCF9;" type="submit" value="搜索" />
            <input type="text" placeholder="城市" name="City"><input class="auto-style2" style="-webkit-box-shadow: 0 1px 0 #fff; -moz-box-shadow: 0 1px 0 #fff; box-shadow: 0 1px 0 #fff; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; text-shadow: 0 1px 0 #6CDCF9;" type="submit" value="搜索" /><input type="text" placeholder="按时间1    查找" onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;"/><input class="auto-style2" style="-webkit-box-shadow: 0 1px 0 #fff; -moz-box-shadow: 0 1px 0 #fff; box-shadow: 0 1px 0 #fff; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; text-shadow: 0 1px 0 #6CDCF9;" type="submit" value="搜索" /><br />         
        </div>
			&nbsp;&nbsp;<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
             <HeaderTemplate>
                 <table align="center" cellspacing="0" class="tablesorter" >
                     <thead>
                         <tr>
                             <th>&nbsp;用户ip</th>
                             <th>&nbsp;&nbsp;&nbsp;用户城市</th>
                             <th>&nbsp;&nbsp;手机</th>
                             <th>&nbsp;&nbsp;&nbsp;二维码号</th>
                             <th>&nbsp;&nbsp;扫码时间</th>
                         </tr>
                     </thead>
                     <tbody>
                     </tbody>
                 </table>
             </HeaderTemplate>
             <ItemTemplate>
                 <tr>
                     <td>&nbsp;<%#Eval("ip")%></td>
                     <td>&nbsp;&nbsp;<%#Eval("city")%></td
                     <td>&nbsp;&nbsp;<%#Eval("os") %></td><td>&nbsp;&nbsp;<%#Eval("name")%></td>
                     <td>&nbsp;&nbsp;<%#Eval("time")%></td>
                 </tr>
             </ItemTemplate>
             <FooterTemplate>
                 </tbody>
                 </table>
             </FooterTemplate>
         </asp:Repeater>

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" 
             SelectCommand="SELECT * FROM [userinfo] WHERE (([city] LIKE '%' + @city + '%') AND ([name] LIKE '%' + @name + '%'))"
              DeleteCommand="DELETE FROM [userinfo] WHERE [id] = @id"
              InsertCommand="INSERT INTO [userinfo] ([ip], [city], [os], [name], [time]) VALUES (@ip, @city, @os, @name, @time)" 
              UpdateCommand="UPDATE [userinfo] SET [ip] = @ip, [city] = @city, [os] = @os, [name] = @name, [time] = @time WHERE [id] = @id">
             <DeleteParameters>
                 <asp:Parameter Name="id" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="ip" Type="String" />
                 <asp:Parameter Name="city" Type="String" />
                 <asp:Parameter Name="os" Type="String" />
                 <asp:Parameter Name="name" Type="String" />
                 <asp:Parameter Name="time" Type="DateTime" />
             </InsertParameters>
             <SelectParameters>
                 <asp:FormParameter DefaultValue="上海" FormField="City" Name="city" Type="String" />
                 <asp:FormParameter DefaultValue="001" FormField="Code" Name="name" Type="String" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="ip" Type="String" />
                 <asp:Parameter Name="city" Type="String" />
                 <asp:Parameter Name="os" Type="String" />
                 <asp:Parameter Name="name" Type="String" />
                 <asp:Parameter Name="time" Type="DateTime" />
                 <asp:Parameter Name="id" Type="Int32" />
             </UpdateParameters>
        </asp:SqlDataSource>
     


        <br />
     


     </form>
     


     </div>
    </form>
</body>
</html>
