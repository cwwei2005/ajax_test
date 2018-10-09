<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--jquery需要引入一个js文件 并且这个js文件是在所有js代码之前--%>
    <%--注意：external libraries 应该有一个jquery jar，否则要添加jar--%>
        <script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
        function getCourse() {
            /*jquery封装ajax，使用ajax发送http异步请求*/
            $.ajax({
                url : '/myServlet',
                type: 'GET',
                dataType : 'text',
                async : true,
                timeout : 5000,
                success : function(data) {
                    document.getElementById('course').innerHTML = data;
                },
                error : function() {
                    var errorMsg = '无法获取课程';
                    document.getElementById('course').innerHTML = errorMsg;
                }
            });

            /*方式二*/
            // $("#course").load("myServlet",{"str":"Hello","str2":"World"})

            /*方式三*/
            // $.post("myServlet",{"str":"你很好","str2":"你很坏"},function(data){
            //     alert(data);
            // },"html");
        }
    </script>
</head>
<body>
<input type="button" id="me" value="查看课程" onclick="getCourse()"/>
<div id="course"></div>
</body>
</html>




<%--$.ajax发送数据的几种形式--%>

<%--//1 直接在url中传递--%>
<%--$.ajax({--%>
<%--type: "POST",--%>
<%--url: "/testAjax/addUser?id=1&name=zhangxiaofan&sex=male",--%>
<%--success:function(data){--%>
<%--//TODO--%>
<%--}--%>
<%--})--%>

<%--//2 html页面from表单序列化--%>
<%--var formData = $("#form").serialize();--%>
<%--$.ajax({--%>
<%--type: "POST",--%>
<%--url: "/testAjax/addUser",--%>
<%--data: formData,--%>
<%--success:function(data){--%>
<%--//TODO--%>
<%--}--%>
<%--})--%>

<%--//3 拼接data字符串--%>
<%--var formData = $("#form").serialize();--%>
<%--$.ajax({--%>
<%--type: "POST",--%>
<%--url: "/testAjax/addUser",--%>
<%--data: "id=1&name=zhangxiaofan&sex=male",--%>
<%--success:function(data){--%>
<%--//TODO--%>
<%--}--%>
<%--})--%>

<%--//4 简单的js对象--%>
<%--var userData = {--%>
<%--id:1,--%>
<%--name:zhangxiaofan,--%>
<%--sex:male--%>
<%--}--%>
<%--$.ajax({--%>
<%--type: "POST",--%>
<%--url: "/testAjax/addUser",--%>
<%--data: userData,     //或者data:{id:1,name:zhangxiaofan,sex:male}--%>
<%--success:function(data){--%>
<%--//TODO--%>
<%--}--%>
<%--})--%>
