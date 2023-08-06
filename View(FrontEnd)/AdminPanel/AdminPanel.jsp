<%@page import="model.UserDAO"%>
<%@ include file="../AdminPanel/scriplets/AdminLoginValidation.jsp"%>
<%@ include file="scriplets/validationScriptlet.jsp"%>
<%@ include file="wrapper/wrapper1.jsp"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>




<div class="row text-center ">
	<header class="text-start">
		<h1>Dashboard</h1>
	</header>
	<div class="col">a</div>
	<div class="col">b</div>
	<div class="col">c</div>
	<div class="col">d</div>
	<div class="col">e</div>
	<div class="col">f</div>
	
	
	
	
	
	
<canvas id="myChart" style="width:100%;max-width:600px"></canvas>

<script>
var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
var yValues = [55, 49, 44, 24, 15];
var barColors = ["red", "green","blue","orange","brown"];

new Chart("myChart", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    legend: {display: false},
    title: {
      display: true,
      text: "World Wine Production 2018"
    }
  }
});
</script>
</div>

<%@ include file="wrapper/wrapper2.jsp"%>
</body>

</html>