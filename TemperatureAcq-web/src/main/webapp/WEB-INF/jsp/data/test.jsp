<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--获取绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/static/css/mycss/combo.select.css"  media="all">
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <script src="${ctx}/static/js/myjs/jquery.combo.select.js"></script>
</head>
<body>
<h1>默认</h1>
<div class="zzsc">
    <select>
        <option value="">月份</option>
        <option value="一月">一月</option>
        <option value="二月">二月</option>
        <option value="三月">三月</option>
        <option value="四月">四月</option>
        <option value="五月">五月</option>
        <option value="六月">六月</option>
        <option value="七月">七月</option>
        <option value="八月">八月</option>
        <option value="九月">九月</option>
        <option value="十月">十月</option>
        <option value="十一月">十一月</option>
        <option value="十二月">十二月</option>
    </select>
</div>
<script>
    $(function() {
        $('select').comboSelect();
    });
</script>
</body>
</html>
