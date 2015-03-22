<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminmanager.aspx.cs" Inherits="tissot.adminmanager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理员登录</title>


    <script>
        $(function(){
            $("#yes").click(
            function (){
                var Adminname=$("#adminname").val();
                var Pwd=$("#password").val();

                
            }    
                )
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    <input type="text" id="adminname" placeholder="请输入姓名" />
    <input type="password" id="pasword" placeholder="请输入密码" />
    </div>
    <div>
        <input type="button" id="yes"  />
    </div>
    </form>
</body>
</html>
