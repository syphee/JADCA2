<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="login.css" /> 

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<section class="forms-section">
    <h1 class="section-title">SP BookStore Rentals</h1>
    <div class="forms">
      <div class="form-wrapper is-active">
        <button type="button" class="switcher switcher-login">
          Login
          <span class="underline"></span>
        </button>
        
        
        
        
        
        <form class="form form-login" action="./../Controller(BackEnd)/verifyUser.jsp" method="post">
          <fieldset>
            <legend>Please, enter your email and password for login.</legend>
            <div class="input-block">
              <label for="login-email">E-mail</label>
              <input id="login-email" type="text" name="loginid" required>
            </div>
            <div class="input-block">
              <label for="login-password">Password</label>
              <input id="login-password" type="password" name="password" required>
            </div>
          </fieldset>
          <input type="submit" class="btn-login" value="Login">
          
        </form>
        
        
        
      </div>
      <div class="form-wrapper">
        <button type="button" class="switcher switcher-signup">
          Sign Up
          <span class="underline"></span>
        </button>
        <form class="form form-signup">
          <fieldset>
            <legend>Please, enter your email, password and password confirmation for sign up.</legend>
            <div class="input-block">
              <label for="signup-email">E-mail</label>
              <input id="signup-email" type="email" required>
            </div>
            <div class="input-block">
              <label for="signup-password">Password</label>
              <input id="signup-password" type="password" required>
            </div>
            <div class="input-block">
              <label for="signup-password-confirm">Confirm password</label>
              <input id="signup-password-confirm" type="password" required>
            </div>
          </fieldset>
          <button type="submit" class="btn-signup">Register</button>
        </form>
      </div>
    </div>
  </section>

  <script src="login.js"></script>
  
</body>
</html>