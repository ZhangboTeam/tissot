<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Serch.aspx.cs" Inherits="tissot.Serch" %>
<script runat="server" >

    private int Countall;
    private int Countsumname;
    private int Countcity;
    private int Countname;
    private int Countos;
    private int Counttime;
    public string page= "";
    public string city = "";
    public string Countmaxname;
    protected override void OnLoad(EventArgs e)
    {
         base.OnLoad(e);
         page = this.Request["page"];
        if (!IsPostBack)
        {
             this.LoadData();
            AspNetPager1.RecordCount = Countall;
            
            
            //bindData(); //使用url分页，只需在分页事件处理程序中绑定数据即可，无需在Page_Load中绑定，否则会导致数据被绑定两次
        }
    }
    private System.Data.SqlClient.SqlDataReader LoadData()
    {
        var City = new System.Data.SqlClient.SqlParameter("@City", city == null ? "" : city);
        var dr = tissot.SystemDAO.SqlHelper.ExecuteReaderFromStoredProcedure("eusp_userinfo",
           new System.Data.SqlClient.SqlParameter("@startIndex", AspNetPager1.StartRecordIndex),
           new System.Data.SqlClient.SqlParameter("@endIndex", AspNetPager1.EndRecordIndex),
           new System.Data.SqlClient.SqlParameter("@City", "上海")
           );
        this.Countall = (int)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  isnull(count(*),0) from userinfo  where  city like '%" + this.Request["City"] + "%'");
        this.Countname = (int)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  count(distinct([name] )) from userinfo  where city  like '%' + @City + '%' ", City);
        this.Countmaxname = tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  max([name] ) from userinfo  where city  like '%' + @City + '%' ", City).ToString();
        //var countmaxname = new System.Data.SqlClient.SqlParameter("@Countmaxname", Countmaxname == null ? "" : Countmaxname);
        this.Countsumname = (int)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  count([name] ) from userinfo  where city  like '%' + @City + '%' ", City);
        //var cn = new System.Data.SqlClient.SqlConnection(System.Web.Configuration.WebConfigurationManager.AppSettings["con"]);
        //var dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        //this.Countall = (int)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  count(*) from userinfo where city like '%' + @city + '%'", city);
        //this.Countip = (int)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  count(*) from userinfo where city  like '%' + @city + '%' and code=key;", city);
        //this.Countname = (int)tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  count(*) from userinfo where city  like '%' + @ky + '%' and city=key;", City1);

        //this.Countcity = tissot.SystemDAO.SqlHelper.ExecuteScalarText("select  count(distinct([city] )) from userinfo  where city  like '%' + @ky + '%' ", City1);
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
        .auto-style3 {
            text-align: center;
            width: 671px;
        }
    
footer {  
    display: block;
            height: 655px;
            width: 281px;
        } 

.post_message {
text-align: left;
padding: 5px 0;
float:left;
}

.submit_link {
float: right;
margin-right: 3%;
padding: 5px 0;
}

        .auto-style6 {
            text-align: right;
            height: 758px;
            width: 832px;
        }
        .auto-style7 {
            text-align: center;
        }
        </style>
    <script>

    </script>
</head>
<body style="height: 519px; width: 1049px">
    <form id="form1" runat="server">
        <div class="auto-style6">
        <div class="auto-style3">
       <h2> 管理员管理</h2><br />
        </div>
            <div class="auto-style7">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  type="text" id="City" name="City"placeholder="城市或者二维码编号" style="width: 195px; margin-left: 0px" />
        <input type="submit" value="搜索" />
        <%--<input type="text"name="CityCode" placeholder="二维码编号" />--%>
        <%--<input type="submit" value="搜索" />--%>
            </div>
           

            <%--onitemcommand="Repeater1_ItemCommand" DataSourceID="SqlDataSource2"--%>
        <asp:Repeater ID="Repeater1" runat="server" 
              >
         <HeaderTemplate>
             <table align="right">
         <tr>
             <td style="width:100px">用户ip</td><td style="width:100px">城市</td>
             <td style="width:100px">系统</td>
             <td style="width:100px">二维码编号</td><td style="width:100px">扫码时间</td>
         </tr>
         <%--<td style="width:100px">图片</td><td>&nbsp;</td><td>&nbsp;</td></tr>--%>
         </HeaderTemplate>
         <ItemTemplate>
         <tr style="background-color:Green">
         <td><%# Eval("ip") %></td><td><%# Eval("city") %></td>
         <td><%# Eval("os") %></td><td><%# Eval("name") %></td>
         <td><%# Eval("time")%></td>
         <%--<td><img width="60px" height="60px" src='<%# "images/" + Eval("photo") %>' /></td>--%>
         <%--<td><asp:LinkButton ID="btnDelete" runat="server" Text="删除" CommandName='Delete' CommandArgument='<%# Eval("sid") %>'></asp:LinkButton></td>
         <td><asp:LinkButton ID="btnEdit" runat="server" Text="编辑" CommandName='Edit' CommandArgument='<%# Eval("sid") %>'></asp:LinkButton></td>--%>
         </tr>
         </ItemTemplate>
         <AlternatingItemTemplate>
         <tr style="background-color:Green">
         <td><%# Eval("ip") %></td><td><%# Eval("city") %></td>
         <td><%# Eval("os") %></td><td><%# Eval("name") %></td>
         <td><%# Eval("time")%></td>
         <%--<td><img width="60px" height="60px" src='<%# "images/" + Eval("photo") %>' /></td>--%>
         <%--<td><asp:LinkButton ID="btnDelete" runat="server" Text="删除" CommandName='Delete' CommandArgument='<%# Eval("sid") %>'></asp:LinkButton></td>
         <td><asp:LinkButton ID="btnEdit" runat="server" Text="编辑" CommandName='Edit' CommandArgument='<%# Eval("sid") %>'></asp:LinkButton></td>--%>
         </tr>
         </AlternatingItemTemplate>
         <SeparatorTemplate>
         <tr><td colspan="5"><hr /></td></tr>
         </SeparatorTemplate>
         <FooterTemplate></table></FooterTemplate>
         </asp:Repeater>
        <%--<div class="auto-style4">
            <label>
            汇总：&nbsp;&nbsp;&nbsp;&nbsp; 有</label>
            <label>
            <%#Countall%>扫码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 共领取</label>
            <label>
            <%#Countname %>元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2元的</label>
            <label>
            <%#CountCity%>份&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 50元的 <% %>份</label>
        </div>--%>
            <footer class="auto-style4">
                <div class="auto-style4">
                &nbsp;<div class="auto-style8">
                        <label ><h2>
                        汇总：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 有</h2></label>
                        <label>
                        <h2><%#Countall%>人扫码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 共扫</h2></label>
                        <label>
                        <h2><%#Countname%>种码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其中</h2></label>
                        <label>
                       <h2><%#Countmaxname %>扫码人最多&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共有<%#Countsumname %>人</h2></label>
                    </div>
            </div>
        </footer>
   

            <%--<webdiyer:aspnetpager ID="AspNetPager1"  runat="server" Width="50%" UrlPaging="true" ShowPageIndexBox="Always" PageIndexBoxType="DropDownList"  
                    FirstPageText="【首页】"
    LastPageText="【尾页】" NextPageText="【后页】"
        PrevPageText="【前页】" NumericButtonTextFormatString="【{0}】"   TextAfterPageIndexBox="页" TextBeforePageIndexBox="转到第"  HorizontalAlign="right" PageSize="10" OnPageChanged="AspNetPager1_PageChanged" EnableTheming="true" CustomInfoHTML="Page  <font color='red'><b>%CurrentPageIndex%</b></font> of  %PageCount%  Order %StartRecordIndex%-%EndRecordIndex%">
                </webdiyer:aspnetpager>--%>
             <%--<Webdiyer:AspNetPager id="AspNetPager1" runat="server"align="right" HorizontalAlign="Right"  FirstPageText="<<" LastPageText=">>" PrevPageText="<" NextPageText=">" NumericButtonTextFormatString="-{0}-" Width="600px"

           ShowCustomInfoSection="Left" ShowBoxThreshold="2" PageSize="5"  InputBoxClass="text2" TextAfterInputBox="" OnPageChanging="AspNetPager1_PageChanging"  />--%>
    
             <webdiyer:AspNetPager ID="AspNetPager1" runat="server" Width="100%" UrlPaging="true" ShowPageIndexBox="Always" PageIndexBoxType="DropDownList"  
                    FirstPageText="【首页】"
    LastPageText="【尾页】" NextPageText="【后页】"
        PrevPageText="【前页】" NumericButtonTextFormatString="【{0}】"   TextAfterPageIndexBox="页" TextBeforePageIndexBox="转到第"  HorizontalAlign="right" PageSize="10" OnPageChanged="AspNetPager1_PageChanged" EnableTheming="true" CustomInfoHTML="Page  <font color='red'><b>%CurrentPageIndex%</b></font> of  %PageCount%  Order %StartRecordIndex%-%EndRecordIndex%">
                </webdiyer:AspNetPager>
    
            <br />
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT * FROM [userinfo] WHERE ([city] LIKE '%' + @name + '%')OR ([name] LIKE '%' + @name + '%')">
            <SelectParameters>
                <asp:FormParameter DefaultValue="中国" FormField="City" Name="name" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

            <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT * FROM [userinfo] WHERE ([name] LIKE '%' + @name + '%')">
            <SelectParameters>
                <asp:FormParameter DefaultValue="00" FormField="Code" Name="name" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
            </div>
    </form>
    </body>
</html>
