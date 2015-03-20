<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="proinfo.aspx.cs" Inherits="tissot.proinfo" %>
<script runat="server">
   
    public void Page_Load(object sender, EventArgs e)
    {
        string url = "http://www.ip138.com/ips8.asp";
        string regStr = "(?<=<td\\s*align=\\\"center\\\">)[^<]*?(?=<br/><br/></td>)";
        //IP正则 
        string ipRegStr = "((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)";
        //IP地址 
        string uip = string.Empty;
        //国家 
        string country = string.Empty;
        //省市 
        string adr = string.Empty;
        //得到网页源码 
        string html = GetHtml(url);
        Regex reg = new Regex(regStr, RegexOptions.None);
        Match ma = reg.Match(html);
        html = ma.Value;
        Regex ipReg = new Regex(ipRegStr, RegexOptions.None);
        ma = ipReg.Match(html);
        //得到IP 
        uip = ma.Value;
        int index = html.LastIndexOf("：") + 1;
        //得到国家 
        country = html.Substring(index);
        adr = GetAdrByIp(uip);
        lk.Text = "IP：" + uip + " 国家：" + "中国 " + " 省市：" + country;

        string os = string.Empty;
        string agent = HttpContext.Current.Request.UserAgent;
        string[] keywords = { "Android", "iPhone", "iPod", "iPad", "Windows Phone", "MQQBrowser" };
        //排除 Windows 桌面系统            
        if (!agent.Contains("Windows NT") || (agent.Contains("Windows NT") && agent.Contains("compatible; MSIE 9.0;")))
        {
            //排除 苹果桌面系统 

            if (!agent.Contains("Windows NT") && !agent.Contains("Macintosh"))
            {
                foreach (string item in keywords)
                {
                    if (agent.Contains(item))
                    {
                        STos.Text = item;
                        os = "android系统";
                        

                    }
                }
            }
            else
            {
                os = "苹果系统";
                

            }

        }
        else
        {
            os = "计算机";

            
        }
   
         
          Dictionary<string, string> clientInfos = new Dictionary<string, string>();

            try
            {



                string ip = Request.UserHostAddress;

                string userAgent = Request.UserAgent == null ? "无" : Request.UserAgent;

                if (Request.ServerVariables["HTTP_UA_CPU"] == null)

                    clientInfos.Add("CPU 类型", "未知");

                else

                    clientInfos.Add("CPU 类型", Request.ServerVariables["HTTP_UA_CPU"]);

                clientInfos.Add("操作系统", this.GetOSNameByUserAgent(userAgent));

                clientInfos.Add("IP 地址", ip);

                if (Request.Browser.ClrVersion == null)

                    clientInfos.Add(".NET CLR 版本", "不支持");

                else

                    //clientInfos.Add(".NET CLR 版本", Request.Browser.ClrVersion.ToString());

                    clientInfos.Add("浏览器", Request.Browser.Browser + Request.Browser.Version);

                //clientInfos.Add("支持 ActiveX", Request.Browser.ActiveXControls ? "支持" : "不支持");

                //clientInfos.Add("支持 Cookies", Request.Browser.Cookies ? "支持" : "不支持");

                //clientInfos.Add("支持 CSS", Request.Browser.SupportsCss ? "支持" : "不支持");

                //clientInfos.Add("语言", Request.UserLanguages[0]);



                string httpAccept = Request.ServerVariables["HTTP_ACCEPT"];

                if (httpAccept == null)

                    clientInfos.Add("计算机/手机", "未知");

                else if (httpAccept.IndexOf("wap") > -1)

                    clientInfos.Add("计算机/手机", "手机");


                else

                    clientInfos.Add("计算机/手机", "计算机");

                clientInfos.Add("Platform", Request.Browser.Platform);

                clientInfos.Add("Win16", Request.Browser.Win16 ? "是" : "不是");

                clientInfos.Add("Win32", Request.Browser.Win32 ? "是" : "不是");



                if (Request.ServerVariables["HTTP_ACCEPT_ENCODING"] == null)

                    clientInfos.Add("Http Accept Encoding", "无");

                else

                    //clientInfos.Add("Http Accept Encoding", Request.ServerVariables["HTTP_ACCEPT_ENCODING"]);

                clientInfos.Add("User Agent", userAgent);

            }

            catch (Exception ex)
            {

                Response.Write(ex.Message);

            }

            // 根据 Dictionary 中的内容在 Table 中显示客户端信息

            this.Response.Write("<table cellpadding=0 cellspacing=0>");

            this.Response.Write("<tr>");

            this.Response.Write("<td width=145>项目</td>");

            this.Response.Write("<td>值</td>");

            this.Response.Write("</tr>");

            foreach (string key in clientInfos.Keys)
            {

                this.Response.Write("<tr>");

                this.Response.Write("<td>" + key + "</font></td>");

                this.Response.Write("<td>" + clientInfos[key].ToString() + "</td>");

                this.Response.Write("</tr>");

            }

            this.Response.Write("</table>");
        }

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
       <%-- <%=Request.Browser.Platform%>--%>

    </div>
       <%-- <asp:Label id="uip" runat="server"></asp:Label>
         <asp:Label id="country" runat="server"></asp:Label>
        <asp:Label id="os" runat="server"></asp:Label>--%>
      <%-- <input id="uip" value="<%=this.Request["uip"]  %>" type="hidden" />
         <input id="country" value="<%=this.Request["country"]  %>" type="hidden" />--%>
       

    <%
        //var uip = this.Request["uip"];
        //var country = this.Request["country"];
        //var os = this.Request["os"];
        //tissot.SystemDAO.SqlHelper.ExecteNonQueryText("insert into userinfo(ip,city,os,time) values (@uip,@country,os,getdate())",
        //new System.Data.SqlClient.SqlParameter("@uip", uip),
        //new System.Data.SqlClient.SqlParameter("@country", country));
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
