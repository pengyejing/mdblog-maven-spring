<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.io.*" %>
<%@ page import="com.lsj.util.*" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>

<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
	Configuration blogConfig = (Configuration)wac.getBean("blogConfiguration");
	String viewName = "上传";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap.min.css">
		<link href="${pageContext.request.contextPath}/resource/home.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/resource/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap.min.js"></script>
		<title>Shakeel</title>
	</head>
	
	<body>　
		<nav class="navbar navbar-default navbar-fixed-top" style="opacity: .9" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="http://www.yinwang.org/#">上传</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<%
							if(blogConfig != null){
								for(UrlButton btn : blogConfig.getUrlButtons()){
									String name = btn.getName();
									String url = btn.getUrl();
									String classType = viewName.equals(name) ? "class=\"active\"" : "";
						%>
									<li <%= classType %>><a href="<%= url %>"><%= name %></a></li>		
						<%
								}
							}
						 %>
					</ul>
				</div>
			</div>
		</nav>
		
		
		
		
		<div style="margin: 5% 10% 2% 10%">
			<form action="${pageContext.request.contextPath}/upload.do" method="post" enctype="multipart/form-data">
				<table style="width: 100%">
					<tbody><tr>
						<td width="70%"><ul class="list-group">
				          	 <li class="list-group-item title">
				          	 	<input type="text" name="postdir" placeholder="input dir">
				          	 </li>
				          	 <li class="list-group-item title">
				          	 	<input type="file" name="file">
				          	 </li>
				          	 <li class="list-group-item title">
				          	 	<input type="submit" name="submit" value="submit">
				          	 </li>
						</ul></td>
					</tr></tbody>
				</table>
			</form>
		</div>
	</body>
</html>