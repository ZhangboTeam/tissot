<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="proinfo.aspx.cs" Inherits="tissot.proinfo" %>
<script runat="server">

            
</script>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>跳转页面</title>
 

    
</head>
<body>
    <form id="form1" runat="server">
   <%-- <div>
        <%=Request.UserHostAddress%>

    </div>--%>
         <div>
        <%=Request.Browser.Platform%>

    </div>
       <input id="name" value="<%=this.Request["name"]  %>" type="hidden" />
         <input id="url" value="<%=this.Request["url"]  %>" type="hidden" />
        <%--<input id="name" value="<%=this.Request["name"]  %>" type="hidden" />--%>

    <%
          
            tissot.SystemDAO.SqlHelper.ExecteNonQueryText("insert into userinfo(ip,city,time) values (@uip,@country,getdate())",
            new System.Data.SqlClient.SqlParameter("@uip", uip),
            new System.Data.SqlClient.SqlParameter("@country", country));
    %>
        <div>
        <asp:Label id="Label1" runat="server"></asp:Label>

       </div>
        <div>
        <asp:Label id="lo" runat="server"></asp:Label>

       </div>
        <div>
        <asp:Label id="Label3" runat="server"></asp:Label>

       </div>
           <div>
        <asp:Label id="Label2" runat="server"></asp:Label>

       </div>
        <div>
        <asp:Label id="lk" runat="server"></asp:Label>

       </div>
    <div>
        <%=Request.ServerVariables.Get("HTTP_USER_AGENT") %>>
    </div>

    <div>
        <asp:Label id="lblIPAddress" runat="server"></asp:Label>
    </div>
   
     <div>
        <asp:Label id="strbow" runat="server"></asp:Label>

       </div>
   <div>
        <asp:Label id="STos" runat="server"></asp:Label>

       </div>
          <div>
        <asp:Label id="Address" runat="server"></asp:Label>

       </div>
       
    </form>
  
</body>
</html>
