<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="tissot.view"  %>
<script runat="server">

    public void Page_Load(object sender, EventArgs e)
        {
        
        
        //判断code在表中是否存在
        //如果在进行插入操作
       var sql = string.Format("select count(*) from uurl where name='{0}'", this.Request["code"] );
       var exists = tissot.SystemDAO.SqlHelper.Exists(sql);
       if (exists)
        {

            //HttpRequest request = HttpContext.Current.Request;
            //string uip = request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            //if (string.IsNullOrEmpty(uip))
            //{
            //    uip = request.ServerVariables["REMOTE_ADDR"];
            //}
            //if (string.IsNullOrEmpty(uip))
            //{
            //    uip = request.UserHostAddress;

            //}
            //if (string.IsNullOrEmpty(uip))
            //{
            //    uip = "0.0.0.0";
            //}
            //lblIPAddress.Text = uip;

            //string country = GetstringIpAddress(uip);

            string uip = GetClientIP();
            //lblIPAddress.Text = uip;
            string count = "http://api.91cha.com/ip?key=f150e3f3eb5e4c96810ead5534eff2ba&ip=" + uip;
            //co1.Text = count;
            string country = string.Empty;
            string countr = string.Empty;
            string html = GetData(count);
            Newtonsoft.Json.Linq.JObject obj = Newtonsoft.Json.Linq.JObject.Parse(html);
            country = obj["data"]["country"].ToString() + obj["data"]["city"].ToString();
            //coll.Text = country;
  
        
            //string regStr = "(?<=<span\\s*id=\\\"cz_addr\\\">).*?(?=</span>)";
            //string ipRegStr = "((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)";
            //Regex reg = new Regex(regStr, RegexOptions.None);
            //Regex ipReg = new Regex(ipRegStr, RegexOptions.None);
            //Match ma = reg.Match(html);
            //ma = ipReg.Match(html);
            //html = ma.Value;
            //int index = html.LastIndexOf("：") + 15;
            //countr = html.Substring(index);
            //cols.Text = countr;
           
            //string conutry = "http://api.91cha.com/ip?key=f150e3f3eb5e4c96810ead5534eff2ba&ip=uip";
            //co1.Text = conutry;
           
           
            ////获得用户ip，uip；
            ////获得用户城市city，country；
            //string url = "http://www.ip138.com/ips8.asp";
            //string regStr = "(?<=<td\\s*align=\\\"center\\\">)[^<]*?(?=<br/><br/></td>)";
            ////IP正则 
            //string ipRegStr = "((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)";
            ////IP地址 
            //string uip = string.Empty;
            ////国家 
            //string country = string.Empty;
            ////省市 
            //string adr = string.Empty;
            ////得到网页源码 
            //string html = GetHtml(url);
            //Regex reg = new Regex(regStr, RegexOptions.None);
            //Match ma = reg.Match(html);
            //html = ma.Value;
            //Regex ipReg = new Regex(ipRegStr, RegexOptions.None);
            //ma = ipReg.Match(html);
            //////得到IP 
            //uip = ma.Value;
            //int index = html.LastIndexOf("：") + 1;
            ////得到国家 
            //country = html.Substring(index);
            //adr = GetAdrByIp(uip);
            //Address.Text = "IP：" + uip + " 国家：" + country + " 省市：" + adr;          

           
           
           

            //获取用户手机的操作系统
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
                            os = item;
                        }
                    }
                }
                
            }
                 
            
            

     
            //tissot.SystemDAO.SqlHelper.ExecteNonQueryText("insert into userinfo(ip,os,time) values (@uip,@os,getdate())",
            //  new System.Data.SqlClient.SqlParameter("@uip", uip),
            //  new System.Data.SqlClient.SqlParameter("@os", os));
            //  //new System.Data.SqlClient.SqlParameter("@country", country));


            
            //获取用户浏览器
            //采用网上获取的方法
            //采用字典的存储方式
            //string uuip = Request.UserHostAddress;
            Dictionary<string, string> clientInfos = new Dictionary<string, string>();
            try
            {

                
                string userAgent = Request.UserAgent == null ? "无" : Request.UserAgent;
                if (Request.ServerVariables["HTTP_UA_CPU"] == null)
                    clientInfos.Add("CPU 类型", "未知");
                else
                    clientInfos.Add("CPU 类型", Request.ServerVariables["HTTP_UA_CPU"]);
                clientInfos.Add("操作系统", this.GetOSNameByUserAgent(userAgent));
                //clientInfos.Add("IP 地址", uuip);
                if (Request.Browser.ClrVersion == null)
                    clientInfos.Add(".NET CLR 版本", "不支持");
                else
                    //clientInfos.Add(".NET CLR 版本", Request.Browser.ClrVersion.ToString());
                    clientInfos.Add("浏览器", Request.Browser.Browser + Request.Browser.Version);
                //获取浏览器信息
                string httpAccept = Request.ServerVariables["HTTP_ACCEPT"];
                if (httpAccept == null)
                    clientInfos.Add("计算机/手机", "未知");
                else if (httpAccept.IndexOf("wap") > -1)
                    clientInfos.Add("计算机/手机", "手机");
                else
                //clientInfos.Add("计算机/手机", "手机");
                clientInfos.Add("Platform", Request.Browser.Platform);
                clientInfos.Add("Win16", Request.Browser.Win16 ? "是" : "不是");
                clientInfos.Add("Win32", Request.Browser.Win32 ? "是" : "不是");

                //添加用户agent信息；
                if (Request.ServerVariables["HTTP_ACCEPT_ENCODING"] == null)
                    clientInfos.Add("Http Accept Encoding", "无");
                else
                    clientInfos.Add("Http Accept Encoding", Request.ServerVariables["HTTP_ACCEPT_ENCODING"]);
                    //clientInfos.Add("User Agent", userAgent);
            }
                
            catch (Exception ex)
            {

                Response.Write(ex.Message);

            }

            // 根据 Dictionary 中的内容在 Table 中显示客户端信息
            //循环表格输入数据

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
            tissot.SystemDAO.SqlHelper.ExecteNonQueryText("insert into userinfo(ip,city,os,time) values (@uip,@country,@os,getdate())",
                  new System.Data.SqlClient.SqlParameter("@uip", uip),
                  new System.Data.SqlClient.SqlParameter("@os", os),
            new System.Data.SqlClient.SqlParameter("@country", country));

            var uurl = string.Format("select url from uurl where name='{0}'", this.Request["code"]);
            Response.Redirect("http://www.tissot.ch");

        }
               
        
    }
</script>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
    <div>
     <asp:Label id="Address" runat="server"></asp:Label>
    </div>
     <div>
     <asp:Label id="co1" runat="server"></asp:Label>
    </div>
        <div>
     <asp:Label id="coll" runat="server"></asp:Label>
    </div>  
     <div>
     <asp:Label id="cols" runat="server"></asp:Label>
    </div>  
    <div>
       <%-- <%=Request.UserHostAddress%>--%>
    </div>
    <div>
     <asp:Label id="lo" runat="server"></asp:Label>
    </div>
        <div>
     <asp:Label id="STos" runat="server"></asp:Label>
    </div>
        <div>
        <asp:Label id="lblIPAddress" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
