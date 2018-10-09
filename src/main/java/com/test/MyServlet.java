package com.test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            java.sql.Connection connection = ConnectionUtil.getConnection();
            Statement statement = connection.createStatement();
            String sql = "SELECT * FROM course";
            ResultSet rs = statement.executeQuery(sql);
            StringBuilder s = new StringBuilder("拥有的课程有:");
            while(rs.next()) {
                s.append(rs.getString(2));
                if(!rs.isLast()) {
                    s.append("、");
                }
            }
            //解决返回的字符串编码问题
            resp.setCharacterEncoding("utf-8");
            PrintWriter out = resp.getWriter();
            //将数据流入输出流
            out.print(s);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
