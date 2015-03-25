<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inserturl.aspx.cs" Inherits="tissot.Inserturl" %>
<%--<script runat="server">
public void Page_Load(object sender, EventArgs e)
        {
            string name = this.Request["name"];
            string url = this.Request["url"];
         tissot.SystemDAO.SqlHelper.ExecteNonQueryText("insert into uurl(name,url) values (@name,@url)",
                  new System.Data.SqlClient.SqlParameter("@name", name),
                  new System.Data.SqlClient.SqlParameter("@url", url));
}
  
   
</script>--%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2 class="auto-style1">管理</h2>
        <%--<script>

            //function Insert() {
            //    var name = $("#name").val();
            //    var url = $("#url").val();
            //    tissot.SystemDAO.SqlHelper.ExecteNonQueryText("insert into uurl(name,city) values (@name,@url)",
            //      new System.Data.SqlClient.SqlParameter("@name", name),
            //      new System.Data.SqlClient.SqlParameter("@url", url));
            //}
    </script>--%>
   <%-- <div align="center">
    <input type="text" id="name" runat="server" placeholder="插入的code" /><br />
    <input type="text" id="url" runat="server" placeholder="插入的url" /><br />
&nbsp;<input type="submit" runat="server" value="确定" onclick="Insert()" />
    
    </div>--%>
        <p class="auto-style1">
            <asp:TextBox ID="TextBox1" placeholder="插入的code" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style1">
            <asp:TextBox ID="TextBox2" placeholder="插入的url" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style1">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定插入" />
        </p>
    </form>
</body>
</html>
