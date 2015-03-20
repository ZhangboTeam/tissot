using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tissot
{
    public partial class phonemsgs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 将客户端的信息添加到 Dictionary 中
            Dictionary<string, string> clientInfos = new Dictionary<string, string>();

            try
            {

                string ip = Request.UserHostAddress;

                string userAgent = Request.UserAgent == null ? "无" : Request.UserAgent;
                clientInfos.Add(".NET CLR 版本", Request.Browser.ClrVersion.ToString());

                clientInfos.Add("浏览器", Request.Browser.Browser + Request.Browser.Version);

                clientInfos.Add("支持 ActiveX", Request.Browser.ActiveXControls ? "支持" : "不支持");

                clientInfos.Add("支持 Cookies", Request.Browser.Cookies ? "支持" : "不支持");

                clientInfos.Add("支持 CSS", Request.Browser.SupportsCss ? "支持" : "不支持");

                clientInfos.Add("语言", Request.UserLanguages[0]);

                if (Request.ServerVariables["HTTP_UA_CPU"] == null)

                    clientInfos.Add("CPU 类型", "未知");

                else

                    clientInfos.Add("CPU 类型", Request.ServerVariables["HTTP_UA_CPU"]);

                clientInfos.Add("操作系统", this.GetOSNameByUserAgent(userAgent));

                clientInfos.Add("IP 地址", ip);

                if (Request.Browser.ClrVersion == null)

                    clientInfos.Add(".NET CLR 版本", "不支持");

                else

                    clientInfos.Add(".NET CLR 版本", Request.Browser.ClrVersion.ToString());

                clientInfos.Add("浏览器", Request.Browser.Browser + Request.Browser.Version);

                clientInfos.Add("支持 ActiveX", Request.Browser.ActiveXControls ? "支持" : "不支持");

                clientInfos.Add("支持 Cookies", Request.Browser.Cookies ? "支持" : "不支持");

                clientInfos.Add("支持 CSS", Request.Browser.SupportsCss ? "支持" : "不支持");

                clientInfos.Add("语言", Request.UserLanguages[0]);



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

                    clientInfos.Add("Http Accept Encoding", Request.ServerVariables["HTTP_ACCEPT_ENCODING"]);

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

        private string GetOSNameByUserAgent(string userAgent)
        {
            string osVersion = "未知";

            if (userAgent.Contains("NT 6.0"))
            {
                osVersion = "Windows Vista/Server 2008";
            }
            else if (userAgent.Contains("NT 5.2"))
            {
                osVersion = "Windows Server 2003";
            }
            else if (userAgent.Contains("NT 5.1"))
            {
                osVersion = "Windows XP";
            }
            else if (userAgent.Contains("NT 5"))
            {
                osVersion = "Windows 2000";
            }
            else if (userAgent.Contains("NT 4"))
            {
                osVersion = "Windows NT4";
            }
            else if (userAgent.Contains("Me"))
            {
                osVersion = "Windows Me";
            }
            else if (userAgent.Contains("98"))
            {
                osVersion = "Windows 98";
            }
            else if (userAgent.Contains("95"))
            {
                osVersion = "Windows 95";
            }
            else if (userAgent.Contains("Mac"))
            {
                osVersion = "Mac";
            }
            else if (userAgent.Contains("Unix"))
            {
                osVersion = "UNIX";
            }
            else if (userAgent.Contains("Linux"))
            {
                osVersion = "Linux";
            }
            else if (userAgent.Contains("SunOS"))
            {
                osVersion = "SunOS";
            }
            return osVersion;

        }

    }
}