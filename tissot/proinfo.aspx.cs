using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace tissot
{
    public partial class proinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conns = @"server=120.26.56.165\sqlexpress;uid=sa;pwd=123456;database=tissotmsgs";
            SqlConnection co = new SqlConnection(conns);
            co.Open();
            SqlCommand cm = new SqlCommand();
            cm.Connection = co;
            cm.CommandText = "select url from uurl where name='二维码'";
            SqlDataReader fd = cm.ExecuteReader();
            if (fd.Read())
            {
                //SqlDataReader urls = cm.ExecuteReader();
                //lk.Text = urls.ToString();
                //Response.Redirect("http://www.baidu.com");


                //string connstr = "server=WANGJUN-PC;uid=sa;pwd=123456;database=tissotmsgs";
                //SqlConnection conn = new SqlConnection(connstr);
                //conn.Open();
                //SqlCommand cmd = new SqlCommand();
                //cmd.Connection = conn;
                //cmd.CommandText = "insert into userinfo(ip,city,os,name)values('uip','country','ios','二维码')";
                //SqlDataReader dr = cmd.ExecuteReader();
                //conn.Close();



                //HttpRequest request = HttpContext.Current.Request;
                //string result = request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                //if (string.IsNullOrEmpty(result))
                //{
                //    result = request.ServerVariables["REMOTE_ADDR"];
                //}
                //if (string.IsNullOrEmpty(result))
                //{
                //    result = request.UserHostAddress;

                //}
                //if (string.IsNullOrEmpty(result))
                //{
                //    result = "0.0.0.0";
                //}
                //lblIPAddress.Text = result;
                //DataTime.Now.ToLocalTime().ToString();
                //string connection = "server=WANGJUN-PC;uid=sa;pwd=123456;database=tissotmsgs";
                //SqlConnection conn = new SqlConnection("Data Soure=WANGJUN-PC Database=tissotmsgs");
                //conn.Open();
                //SqlCommand cmd = conn.CreateCommand();
                //SqlCommand acmd = new SqlCommand();
                //acmd.Connection = conn;

                //string sql1 = "insert into userinfo(ip,city,os,name)values('192','上海','ios','二维码')";
                //string sql2 = "select city from userinfo";
                //Label1.Text = sql2;

                //string sql2=string.Format("select city from userinfo");
                //Label2.Text = sql1;
                //Label1.Text = sql2;
                //conn.Close();
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
                Address.Text = "IP：" + uip + " 国家：" + "中国 " + " 省市：" + country;
                lo.Text = uip;

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

                string connstr = "120.26.56.165\sqlexpress;uid=sa;pwd=123456;database=tissotmsgs";
                SqlConnection coo = new SqlConnection(connstr);
                coo.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = coo;
                //cmd.CommandText = "insert into userinfo(ip,city,os,name)values('uip','country','ios','二维码')";
                cmd.CommandText = "insert into userinfo(ip,city,os,name,time) values (@uip,@country,@os,'二维码',getdate())";
                cmd.Parameters.Add(new SqlParameter("@uip", uip));
                cmd.Parameters.Add(new SqlParameter("@country", country));
                cmd.Parameters.Add(new SqlParameter("@os", os));
                SqlDataReader dr = cmd.ExecuteReader();
                coo.Close();

                //cm.CommandText = "insert into userinfo(ip,city,os,name,time) values (@uip,@country,@os,'二维码',getdate())";
                //cm.Parameters.Add(new SqlParameter("@uip", uip));
                //cm.Parameters.Add(new SqlParameter("@country", country));
                //cm.Parameters.Add(new SqlParameter("@os", os));
                //SqlDataReader dr = cm.ExecuteReader();
                //lk.Text = dr.ToString();
                //co.Close();
                //Response.Redirect("#");
                // 
                //   string os = string.Empty;
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
                //                os = "android系统";
                //            }
                //        }
                //    }
                //    else {
                //        os = "苹果系统";
                //    }

                //}
                //else
                //{
                //    os="计算机";


                //}         


                //string userAgent = Request.ServerVariables.Get("HTTP_USER_AGENT");
                //string[] agent = userAgent.Split('/');
                ////if (agent.Length > 0)
                ////{

                ////    userPhonetype = agent[0];
                ////}
                //userPhonetype.Text = agent[0];

                //    string strBrowser = "其他";
                //HttpRequest Request = HttpContext.Current.Request;
                //string strAgentInfo = Request.ServerVariables["HTTP_USER_AGENT"];
                //if (Regex.IsMatch(strAgentInfo, "MSIE ([//d]//.[//d])", RegexOptions.IgnoreCase | RegexOptions.Compiled))
                //{
                //    strBrowser = Regex.Match(strAgentInfo, "MSIE ([//d]//.[//d])").Result("IE:$1");
                //}
                //else if (Regex.IsMatch(strAgentInfo, "Opera ([//d]//.[//d])", RegexOptions.IgnoreCase | RegexOptions.Compiled))
                //{
                //    strBrowser = Regex.Match(strAgentInfo, "Opera ([//d]//.[//d])").Result("Opera:$1");
                //}
                //else if (Regex.IsMatch(strAgentInfo, "Opera///([//d]//.[//d])", RegexOptions.IgnoreCase | RegexOptions.Compiled))
                //{
                //    strBrowser = Regex.Match(strAgentInfo, "Opera///([//d]//.[//d])").Result("Opera:$1");
                //}
                //else if (Regex.IsMatch(strAgentInfo, "Firefox///([//d]//.[//d])", RegexOptions.IgnoreCase | RegexOptions.Compiled))
                //{
                //    strBrowser = Regex.Match(strAgentInfo, "Firefox///([//d]//.[//d])").Result("Firefox:$1");
                //}
                //strbow.Text=strBrowser;



                //输出用户信息
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
        }
        

        


           
    //指定Sql Server提供者的连接字符串



          
         public string GetIpDetails()
        {
            string url = "http://www.ip138.com/ips8.asp";
            string regStr = "(?<=<td\\s*align=\\\"center\\\">)[^<]*?(?=<br/><br/></td>)";
            //IP正则 
            string ipRegStr = "((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)";
            //IP地址 
            string ip = string.Empty;
            //国家 
            string country = string.Empty;
            //省市 
            string adr = string.Empty;
            //得到网页源码 
            string html = GetHtml(url);
            Regex reg = new Regex(regStr, RegexOptions.None);
            Match ma = reg.Match(html); html = ma.Value;
            Regex ipReg = new Regex(ipRegStr, RegexOptions.None);
            ma = ipReg.Match(html);
            //得到IP 
            ip = ma.Value;
            int index = html.LastIndexOf("：") + 1;
            //得到国家 
            country = html.Substring(index);
            adr = GetAdrByIp(ip);
            return "IP：" + ip + " 国家：" + country + " 省市：" + adr;
        }



        /// <summary>  
        /// 通过IP得到IP所在地省市（Porschev） 
        /// </summary> 
        /// <param name="ip"></param> 
        /// <returns></returns> 
        public string GetAdrByIp(string uip)
        {
            string url = "http://www.cz88.net/ip/?ip=" + uip;
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

         

        //tissot.SystemDAO.SqlHelper.ExecteNonQueryText("insert into userinfo(ip,city,os,name)values(@ip,@city,@name,getdata()) "),

        
        //获取系统名称
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

       
      
          


            

    

    //    /// <summary> 
    //    /// 获取客户端浏览器类型及版本 
    //    /// </summary> 
    //    /// <returns></returns> 
    //    public string GetUserBrowser()
    //    {
    //        string strBrowser = "其他";
    //        HttpRequest Request = HttpContext.Current.Request;
    //        string strAgentInfo = Request.ServerVariables["HTTP_USER_AGENT"];
    //        if (Regex.IsMatch(strAgentInfo, "MSIE ([//d]//.[//d])", RegexOptions.IgnoreCase | RegexOptions.Compiled))
    //        {
    //            strBrowser = Regex.Match(strAgentInfo, "MSIE ([//d]//.[//d])").Result("IE:$1");
    //        }
    //        else if (Regex.IsMatch(strAgentInfo, "Opera ([//d]//.[//d])", RegexOptions.IgnoreCase | RegexOptions.Compiled))
    //        {
    //            strBrowser = Regex.Match(strAgentInfo, "Opera ([//d]//.[//d])").Result("Opera:$1");
    //        }
    //        else if (Regex.IsMatch(strAgentInfo, "Opera///([//d]//.[//d])", RegexOptions.IgnoreCase | RegexOptions.Compiled))
    //        {
    //            strBrowser = Regex.Match(strAgentInfo, "Opera///([//d]//.[//d])").Result("Opera:$1");
    //        }
    //        else if (Regex.IsMatch(strAgentInfo, "Firefox///([//d]//.[//d])", RegexOptions.IgnoreCase | RegexOptions.Compiled))
    //        {
    //            strBrowser = Regex.Match(strAgentInfo, "Firefox///([//d]//.[//d])").Result("Firefox:$1");
    //        }
    //        return strBrowser;
           
    //    }

    //    #region GetIP()
    //    /// <summary> 
    //    /// 获取ＩＰ 
    //    /// </summary> 
    //    /// <returns></returns> 
    //    public string GetIP()
    //    {
    //        string uip = "";
    //        if (HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
    //        {
    //            uip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
    //        }
    //        else
    //        {
    //            uip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
    //        }
    //        return uip;
    //    }
    //    #endregion

    }
}