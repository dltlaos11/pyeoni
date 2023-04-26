<%@page import="java.util.ArrayList"%>
<%@page import="com.pyeoni.vo.MemberVO"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.MemberValuePair"%>
<%@page import="com.pyeoni.vo.CommentVO"%>
<%@page import="com.pyeoni.model.CommentService"%>
<%@page import="com.pyeoni.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.pyeoni.model.ProductServices"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
ProductVO pv = new ProductVO();
CommentVO cv = new CommentVO();
MemberVO mv = new MemberVO();

List<ProductVO> plist = new ArrayList<>();
List<CommentVO> clist = new ArrayList<>();
List<MemberVO> mlist = new ArrayList<>();

ProductServices ps = new ProductServices();
CommentService cs = new CommentService();

// out.print(ps.detailProduct("APPLE", "1+1", "CU", 1000));
out.print(cs.selectAllComment());

%>
<!--  -->
</body>
</html>

