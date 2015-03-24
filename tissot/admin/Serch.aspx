<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Serch.aspx.cs" Inherits="tissot.Serch" %>
<%--<script >
    

        var cmd = new System.Data.SqlClient.SqlCommand();
        var cn = new System.Data.SqlClient.SqlConnection(System.Web.Configuration.WebConfigurationManager.AppSettings["con"]);
        cmd.Connection = cn;
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

</script>--%>
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
        管理员管理<br />
        </div>
        


        <input type="text" name="City"placeholder="城市" />
        <input type="submit" value="搜索" />
        <input type="text"name="Code" placeholder="二维码编号" />
        <input type="submit" value="搜索" />
        <asp:Repeater ID="Repeater1" runat="server" 
             onitemcommand="Repeater1_ItemCommand" DataSourceID="SqlDataSource2">
         <HeaderTemplate><table>
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
        


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT * FROM [userinfo] WHERE ([name] LIKE '%' + @name + '%')">
            <SelectParameters>
                <asp:FormParameter DefaultValue="00" FormField="Code" Name="name" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT * FROM [userinfo] WHERE ([city] LIKE '%' + @name + '%')">
            <SelectParameters>
                <asp:FormParameter DefaultValue="中国" FormField="City" Name="name" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <br />
    </form>
</body>
</html>
