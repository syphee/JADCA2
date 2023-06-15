<li class="col ">
          <h5 class="card-title fs-3 text-white"><text class="bg-danger p-1 rounded-pill d-inline-block text-truncate" style="max-width: 300px;"><%=title %></text></h5>
          <div class="card bg-black" style="width: 18rem; border">
            <form action="details.jsp" method="post">
	                	<input type="hidden" name="s" value="<%=title%>"/>
             			<input type="image" alt="Submit" src="<%=request.getContextPath()%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/book-imgs/<%=pictureURI%>" class="card-img-top book-img hover-underline-animation" style="max-width: 200px;" />
             </form>
            <div class="card-body">
              <p class="card-text text-white"><%=desc %></p>
            </div>

            <div class="container">
              <div class="row">
              
              
              <%
              // if book has more than 1 quantity
              if(quantity > 0){
              %>
                <div class="col">
                 <form action="<%=request.getContextPath()%>/addToCart" method="post">
	                	<input type="hidden" name="s" value="<%=title%>"/>
	                	<input type="hidden" name="quick_rent" value="true"/>
	                  	<input type="submit" class="btn btn-danger rounded rounded-pill" value="Quick rent">
                 </form>
                </div>
                <div class="col">
                	<form action="<%=request.getContextPath()%>/addToCart" method="post">
	                	<input type="hidden" name="s" value="<%=title%>"/>
	                	<input type="hidden" name="quick_rent" value="false"/>
	                  	<input type="submit" class="btn btn-danger rounded rounded-pill" value="Add to cart">
                  	</form>
                </div>
                <%
                }
                %>
                
                <%
                if(quantity < 1){
                %>
                <div class="col">
                	<button class="btn btn-warning p-2 rounded rounded-pill">Out of stock!</button>
                </div>
                
                <% 
                }
                %>
                

                
              </div>
              
            </div>
            
          </div>
        </li>