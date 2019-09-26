<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% String contentPage = request.getParameter("CONTENTPAGE"); %>
<jsp:include page="top.jsp" flush="false"/>
<jsp:include page="<%= contentPage %>" flush="false"/>
