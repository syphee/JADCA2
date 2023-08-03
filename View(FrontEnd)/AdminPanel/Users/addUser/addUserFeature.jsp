
<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dbDAO.UserDAO"%>
<%@page import="dbDAO.sqlPassword"%>
<%@ include file="../../scriplets/AdminLoginValidation.jsp"%>
<%@ include file="../../scriplets/validationScriptlet.jsp"%>
<%@ include file="../../wrapper/wrapper1.jsp"%>



	<div>
		<header>
			<h1 class="fs-1">Add User</h1>
		</header>
		<hr class="bg-secondary my-1 opacity-100">
		




		<!-- Email -->
		<form action="<%=request.getContextPath() %>/RegisterUser" method="post">

		<div class="container col align-items-center">


			<div class="row my-5">
				<div class="col">Email</div>
				<div class="col">
					<input class="form-control" placeholder="Email" name="loginid"
						id="floatingTextarea">
				</div>
			</div>

			<!-- Password -->
			<div class="row my-5">
				<div class="col">Password</div>
				<div class="col">
					<input class="form-control" placeholder="Password" name="password"
						id="floatingTextarea">
				</div>
			</div>
			
			<div class="row my-5">
				<div class="col">Confirm Password</div>
				<div class="col">
					<input class="form-control" placeholder="Password" name="confirmPassword"
						id="floatingTextarea">
				</div>
			</div>
			






		</div>
		<div>
			<input type="submit" value="Add User" class="btn btn-primary">

		</div>
		</form>
		<!-- Email -->
		

	</div>

<%@ include file="../../wrapper/wrapper2.jsp"%>
	