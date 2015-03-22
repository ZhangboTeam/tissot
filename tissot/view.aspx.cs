using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Net;
using Newtonsoft.Json.Linq;
namespace tissot
{
    public partial class view : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //获得用户ip，uip；
            //获得用户城市city，country；

            


            //var sql = string.Format("select count(*) from uurl where name='{0}'", this.Request["code"]);
            //var exists = tissot.SystemDAO.SqlHelper.Exists(sql);
            //if (exists)
            //{

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
                //string regStr = "(?<=<td\\s*align=\\\"center\\\">)[^<]*?(?=<br/><br/></td>)";
                ////IP正则 
                //string ipRegStr = "((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)";
                //string country=string.Empty;

                ////country = GetstringIpAddress(uip);
                ////Address.Text = country;

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
                //Response.Write("<script>alert('" + html + "')");
                //Regex reg = new Regex(regStr, RegexOptions.None);
                //Match ma = reg.Match(html);
                //html = ma.Value;
                //Response.Write("<br />2:" + html + "<br />jie wei");
                //Regex ipReg = new Regex(ipRegStr, RegexOptions.None);
                //ma = ipReg.Match(html);
                ////得到IP 
                //uip = ma.Value;
                //int index = html.LastIndexOf("：") + 1;
                ////得到国家 
                //country = html.Substring(index);
                //adr = GetAdrByIp(uip);
                //Address.Text = "IP：" + uip + " 国家：" + "中国 " + " 省市：" + country;
                //lo.Text = uip;

                //HttpRequest request = HttpContext.Current.Request;
                //string result = request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                //if (string.IsNullOrEmpty(result))
                //{
                //    uip = request.ServerVariables["REMOTE_ADDR"];
                //}
                //if (string.IsNullOrEmpty(result))
                //{
                //    uip = request.UserHostAddress;

                //}
                //if (string.IsNullOrEmpty(result))
                //{
                //    uip = "0.0.0.0";
                //}
                //lblIPAddress.Text = uip;

                //获取用户手机的操作系统
                //

                //string os = string.Empty;
                //string agent = HttpContext.Current.Request.UserAgent;
                //string[] keywords = { "Android", "iPhone", "iPod", "iPad", "Windows Phone", "MQQBrowser" };
                ////排除 Windows 桌面系统            
                //if (!agent.Contains("Windows NT") || (agent.Contains("Windows NT") && agent.Contains("compatible; MSIE 9.0;")))
                //{
                //    //排除 苹果桌面系统 

                //    if (!agent.Contains("Windows NT") && !agent.Contains("Macintosh"))
                //    {
                //        foreach (string item in keywords)
                //        {
                //            if (agent.Contains(item))
                //            {
                //                STos.Text = item;
                //                os = item;
                //            }
                //        }
                //    }


                //}


                //tissot.SystemDAO.SqlHelper.ExecteNonQueryText("insert into userinfo(ip,os,time) values (@uip,@os,getdate())",
                //  new System.Data.SqlClient.SqlParameter("@uip", uip),
                //  new System.Data.SqlClient.SqlParameter("@os", os));
                ////new System.Data.SqlClient.SqlParameter("@country", country));



                //获取用户浏览器
                //采用网上获取的方法
                //采用字典的存储方式
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


            
            
        }
        public static string GetClientIP()
        {
            string[] IP_Ary;
            string strIP, strIP_list;
            strIP_list = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (strIP_list != null && strIP_list != "")
            {
                strIP_list = strIP_list.Replace("\"", "");
                if (strIP_list.IndexOf(",") >= 0)
                {
                    IP_Ary = strIP_list.Split(',');
                    strIP = IP_Ary[0];
                }
                else
                {
                    strIP = strIP_list;
                }
            }
            else
            {
                strIP = "";
            }
            if (strIP == "")
            {
                strIP = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                strIP = strIP.Replace("\"", "");
            }
            return strIP;
        }


        public string GetData(string url)
        {
            try
            {
                var web = new WebClient();
                Byte[] bytes = web.DownloadData(url);
                return Encoding.GetEncoding("utf-8").GetString(bytes);
                

            }
            catch (Exception ex)
            {
                throw new AggregateException("GET失败:" + ex.Message);
            }
        }
           //跳转到第三方页面获取方法
        public string GetAdrByIp(string uip)
        {
            string url = "http://api.91cha.com/ip?key=f150e3f3eb5e4c96810ead5534eff2ba&ip=" + uip;
            string regStr = "(?<=<span\\s*id=\\\"cz_addr\\\">).*?(?=</span>)";
            //得到网页源码 
            string html = GetHtml(url);
            Regex reg = new Regex(regStr, RegexOptions.None);
            Match ma = reg.Match(html);
            html = ma.Value;
            string[] arr = html.Split(' ');
            return arr[0];
        }

        public string GetHtml(string url)
        {
            string str = "";
            try
            {
                Uri uri = new Uri(url);
                WebRequest wr = WebRequest.Create(uri);
                Stream s = wr.GetResponse().GetResponseStream();
                StreamReader sr = new StreamReader(s, Encoding.Default);
                str = sr.ReadToEnd();
            }
            catch (Exception e)
            {
            }
            return str;

        }





        //public string GetstringIpAddress(string uip)//strIP为IP
        //{
        //    string sURL = "http://www.youdao.com/smartresult-xml/search.s?type=ip&q=" + uip + "";//youdao的URL
        //    string stringIpAddress = "";
        //    using (XmlReader read = XmlReader.Create(sURL))//获取youdao返回的xml格式文件内容
        //    {
        //        while (read.Read())
        //        {
        //            switch (read.NodeType)
        //            {
        //                case XmlNodeType.Text://取xml格式文件当中的文本内容
        //                    if (string.Format("{0}", read.Value).ToString().Trim() != uip)//youdao返回的xml格式文件内容一个是IP，另一个是IP地址，如果不是IP
        //                    {
        //                        stringIpAddress = string.Format("{0}", read.Value).ToString().Trim();//赋值
        //                    }
        //                    break;
        //                //other
        //            }
        //        }
        //    }
        //    return stringIpAddress;
        //}




        //获取系统名称

        public string GetOSNameByUserAgent(string userAgent)
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