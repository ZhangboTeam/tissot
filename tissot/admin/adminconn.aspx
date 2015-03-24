<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminconn.aspx.cs" Inherits="tissot.admin.adminconn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />--%>
        <%--<asp:Repeater ID="Repeater1" runat="server">
     <HeaderTemplate>
     <hr />
     </HeaderTemplate>
     <ItemTemplate><div>
     <asp:Label ID="lblSid" runat="server" Text='<%# Eval("sid") %>'></asp:Label>
     <asp:Label ID="lblSname" runat='server' Text='<%# Eval("sname") %>'></asp:Label>
     <asp:Image ID="imgPhoto" runat="server" ImageUrl='<%# Eval("photo") %>' /></div>
     </ItemTemplate>
     <SeparatorTemplate>
     <hr />
     </SeparatorTemplate>
     <AlternatingItemTemplate>
     <div style="background-color:Olive">
     <asp:Label ID="lblSid" runat="server" Text='<%# Eval("sid") %>'></asp:Label>
     <asp:Label ID="lblSname" runat='server' Text='<%# Eval("sname") %>'></asp:Label>
     <asp:Image ID="imgPhoto" runat="server" ImageUrl='<%# Eval("photo") %>' /></div>
     </AlternatingItemTemplate>
     <FooterTemplate><hr /></FooterTemplate>
     </asp:Repeater>--%>
     <div>

        <asp:Repeater ID="Repeater1" runat="server" 
             onitemcommand="Repeater1_ItemCommand">
         <HeaderTemplate><table>
         <tr ><td style="width:100px">编号</td><td style="width:100px">姓名</td>
         <%--<td style="width:100px">图片</td><td>&nbsp;</td><td>&nbsp;</td></tr>--%>
         </HeaderTemplate>
         <ItemTemplate>
         <tr>
         <td><%# Eval("sid") %></td><td><%# Eval("sname") %></td>
         <%--<td><img width="60px" height="60px" src='<%# "images/" + Eval("photo") %>' /></td>--%>
         <td><asp:LinkButton ID="btnDelete" runat="server" Text="删除" CommandName='Delete' CommandArgument='<%# Eval("sid") %>'></asp:LinkButton></td>
         <td><asp:LinkButton ID="btnEdit" runat="server" Text="编辑" CommandName='Edit' CommandArgument='<%# Eval("sid") %>'></asp:LinkButton></td>
         </tr>
         </ItemTemplate>
         <AlternatingItemTemplate>
         <tr style="background-color:Green">
         <td><%# Eval("sid") %></td><td><%# Eval("sname") %></td>
         <%--<td><img width="60px" height="60px" src='<%# "images/" + Eval("photo") %>' /></td>--%>
         <<%--td><asp:LinkButton ID="btnDelete" runat="server" Text="删除" CommandName='Delete' CommandArgument='<%# Eval("sid") %>'></asp:LinkButton></td>
         <td><asp:LinkButton ID="btnEdit" runat="server" Text="编辑" CommandName='Edit' CommandArgument='<%# Eval("sid") %>'></asp:LinkButton></td>--%>
         </tr>
         </AlternatingItemTemplate>
         <SeparatorTemplate>
         <tr><td colspan="5"><hr /></td></tr>
         </SeparatorTemplate>
         <FooterTemplate></table></FooterTemplate>
         </asp:Repeater>

    
    </div>
    </form>
</body>
</html>
