<%@ page language="java" import="java.io.*,java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%!
   int maxRow = 10;
   int maxCol = 10;
   int today = 3;
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>JSP第一堂课</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <% for(int i=0; i<maxRow;i++) {%>
    <% for(int j=(maxRow-i); j<maxCol;j++){ %>
     *
    <% } %>
    <br/>
    <% } %>
    
    <%
      switch(today){
        case 0:
        	out.println("星期天");
        	break;
        case 1:
        	out.println("星期一");
        	break;
        case 2:
        	out.println("星期二");
        	break;
        case 3:
        	out.println("星期三");
        	break;
        case 4:
        	out.println("星期四");
        	break;
        case 5:
        	out.println("星期五");
        	break;
        case 6:
        	out.println("星期六");
        	break;
        default:
        	break;
      }
     %>
     
     <% for(int font_size =2;font_size<=7;font_size++){ %>
         <br/><font color="#FF0000" size="<%= font_size %>">宋华彪</font><br/>
     <% } %>
     
      <%@ include file="sub.jsp" %>
      
      <jsp:useBean id="one" class="com.ofix.core.OneBean"/>
      <jsp:setProperty name="one" property="message" value="菜鸟教程"/>
      <p>输出信息。。。。</p>
      <jsp:getProperty name="one" property="message"/>
      
      <jsp:element name="xmlElement">
      <jsp:attribute name="xmlElementAttr">
        XML属性值
      </jsp:attribute>
      <jsp:body>
      xml 元素的主体
      </jsp:body>
      </jsp:element>
      
      <%
        Enumeration headerNames = request.getHeaderNames();
        out.println("<table>");
   		while(headerNames.hasMoreElements()){
   		   String paramName = (String)headerNames.nextElement();
   		   out.print("<tr><td>"+paramName+"</td>");
   		   String paramValue = request.getHeader(paramName);
   		   out.println("<td>"+paramValue+"</td></tr>");
   		}     
   		out.println("</table>");
       %>
      
         <%-- response.setIntHeader("Refresh",5); --%>
         <%
         Calendar calendar = new GregorianCalendar();
         String am_pm;
         int hour = calendar.get(Calendar.HOUR);
         int minute = calendar.get(Calendar.MINUTE);
         int second = calendar.get(Calendar.SECOND);
         if(calendar.get(Calendar.AM_PM) == 0){
           am_pm = "AM";
         }else{
           am_pm = "PM";
         }
         String CT = hour+":"+minute+":"+second+" "+am_pm;
         out.println("当前时间是:"+CT);
        %>
        <% String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8")+"<br/>"; %>
        <%= name %>
        <%= request.getParameter("url")+"<br/>" %>
        <%--
          response.sendError(404,"Need authentication.");
         --%>
  </body>
</html>
