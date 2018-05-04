<%@page import="Model.News"%>
<%@page import="com.sun.xml.bind.v2.schemagen.xmlschema.Import"%>
<%@page import="Model.NewsList"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <link rel = "stylesheet" type="text/css" href="WEB-Page/NewsList/newslist.css"/>
 <title>新闻列表页</title>

</head>
<body>
<div id="top">
 <div id="menu">
 <ul>
 <li><img src="WEB-Page/Login/images/login/fly.png" ></li>
 <li>
 <form class="column" style="width:640px;" method="GET" action="find_news_list" name="search">
     <div class="ui fluid  input action">
         <input type="text" name="companyname" placeholder="搜索想要了解的股票公司...">
         <input type="submit" class="medium ui blue button" value="搜一搜" style="background-color: red;"/>
     </div>
  </form></li>
 <li ><a href="">用户:</a>/<a href=""></a></li>
 </ul>
 </div>
</div>

<div id="blog">
 <ul>
 	<%
	   //循环显示数据
	   ArrayList<NewsList> nllist = (ArrayList)request.getAttribute("newslist"); // 取request里面的对象队列
	    if(nllist.size()!=0){
	    	for(int i=0;i<nllist.size();i++){        
		         pageContext.setAttribute("news",nllist.get(i));
		         NewsList news = nllist.get(i);  
		           //保存到页面pageContext里面方便下面进行EL表达式调用
	 %>
				 <li>
					 <div class="blog-left">
						 <p ><a href="http://localhost:8080/SimpleServlet/find_news?new_id=<%=nllist.get(i).getNew_id()%>" class="title"><%=nllist.get(i).getNew_title() %></a></p>
						 <p style="margin-top: 20px"><a href="<%=nllist.get(i).getNew_href() %>">新闻原链接</a></p>
						 <p style="margin-top: 20px">发布时间:<%=nllist.get(i).getNew_date() %></p>
					 </div>
				 </li>
	<%
			      }
	  		}else{
	     
	     %>
				 <p ><a href="#" class="title">没有该公司新闻</a></p>
	     <%
	    }
	%>

</ul>

</div>

<div id="bottom">
<div id="bottom-content">
<div id="content-left">
<p> 网站位置 | 关于我们 | 意见反馈 |</p>

</div>
<div id="content-right">
</div>
</div>
</div>
</body>
</html>