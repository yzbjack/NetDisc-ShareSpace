<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="demo.sharespace.bean.FileBean" %>
<%@ page import="demo.sharespace.dao.MySpaceDao" %>  
<%@ page import="demo.sharespace.util.RequestUtils" %>    
<%@ page import="java.util.List" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<center>
<%

if("1".equals(session.getAttribute("login_flag"))){
%>
<a id="ss" href="/ShareSpace/space/ShareSpace.jsp">Share Space</a>
<a id="ms" href="/ShareSpace/space/MySpace.jsp">My Space</a>
<a id="gs" href="/ShareSpace/space/GroupSpace.jsp">Group Space</a>
<a id="upload" href="/ShareSpace/upload.jsp">上传</a>
欢迎,
<%=session.getAttribute("username") %>
<a id="logout" href="/ShareSpace/LogoutServlet">登出</a>


<%
MySpaceDao mySpaceDao = new MySpaceDao();
List<FileBean> fileList = mySpaceDao.getMyFileList(RequestUtils.getUserId(request));
%>
<br/>
<br/>
<br/>
<table border="1">
<tr><th>文件ID</th><th>文件名</th><th>文件路径</th><th>操作</th></tr>
<%
for(FileBean file : fileList){
%>
<tr>
<td><%=file.getFileId() %></td>
<td><%=file.getFileName() %></td>
<td><%=file.getFilePath() %></td>
<% out.println("<td><a href = \"/ShareSpace/DownloadServlet?fileId=" + file.getFileId() + "\"> 下载 </a></td>"); %>
</tr>
<%
}
%>
</table>
<%
}else{
	response.sendRedirect("/ShareSpace/login.jsp");
}
%>
</center>
</body>
</html>