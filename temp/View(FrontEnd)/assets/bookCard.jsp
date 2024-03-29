<li class="col ">
  			
          <h5 class="card-title fs-3 text-white"><text class="bg-danger p-1 rounded-pill d-inline-block text-truncate" style="max-width: 300px;"><%=title %></text></h5>
          <div class="card bg-black" style="width: 18rem; border">
          <%
              // if book has more than 1 quantity
              if(quantity > 0){
              %>
              	<text class="bg-info p-1 rounded-pill d-inline-block text-truncate" style="max-width: 300px;">Selling Fast! <%=quantity %> left!</text>
              <%} %>
            <form action="details.jsp" method="get">
            			<input type="hidden" name="view" value="<%=id%>"/>
	                	
             			<input type="image" alt="Details" src="<%=request.getContextPath()%>/BookstoreCA1/JAD-CA1/View(FrontEnd)/assets/book-imgs/<%=pictureURI%>" class="card-img-top book-img hover-underline-animation" style="max-width: 200px;" />
             </form>
            <div class="card-body">
             <h5 class="card-title text-white"><text class=" p-1 rounded-pill d-inline-block text-truncate" style="max-width: 300px;"><%=title %></text></h5>
             	<hr class="bg-danger my-1 opacity-100">
              <p class="card-text text-white"><%=desc %></p>
            </div>

            <div class="container">
              <div class="row">
              
              
              <%
              // if book has more than 1 quantity
              if(quantity > 10){
              %>
                <div class="col">
                 <form action="<%=request.getContextPath()%>/addToCart" method="post">
	                	<input type="hidden" name="s" value="<%=title%>"/>
	                	<input type="hidden" name="book_id" value="<%=id%>"/>
	                	<input type="hidden" name="quick_rent" value="true"/>
	                  	<input type="submit" class="btn btn-danger rounded rounded-pill" value="Quick rent">
	                  	<input
				type="hidden" value="<%=request.getParameter("s") %>" name="search" /> <input
				type="hidden" value="<%=request.getParameter("genre") %>" name="genre" /> <input
				type="hidden" value="<%=request.getParameter("author_query") %>" name="author_query" /> <input
				type="hidden" value="<%=request.getParameter("sortBy") %>" name="sortBy" />
                 </form>
                </div>
                <div class="col">
                	<form action="<%=request.getContextPath()%>/addToCart" method="post">
	                	<input type="hidden" name="s" value="<%=id%>"/>
	                	<input type="hidden" name="quick_rent" value="false"/>
	                  	<input type="submit" class="btn btn-danger rounded rounded-pill" value="Add to cart">
	            <input
				type="hidden" value="<%=request.getParameter("s") %>" name="s" /> <input
				type="hidden" value="<%=request.getParameter("genre") %>" name="genre" /> <input
				type="hidden" value="<%=request.getParameter("author_query") %>" name="author_query" /> <input
				type="hidden" value="<%=request.getParameter("sortBy") %>" name="sortBy" />
                  	</form>
                </div>
                <%
                }
                %>
                
                <%
              // if book has more than 1 quantity
              if(quantity > 0){
              %>
                <div class="col">
                 <form action="<%=request.getContextPath()%>/addToCart" method="post">
	                	<input type="hidden" name="s" value="<%=title%>"/>
	                	<input type="hidden" name="book_id" value="<%=id%>"/>
	                	<input type="hidden" name="quick_rent" value="true"/>
	                  	<input type="submit" class="btn btn-danger rounded rounded-pill" value="Quick rent">
	                  	<input
				type="hidden" value="<%=request.getParameter("s") %>" name="search" /> <input
				type="hidden" value="<%=request.getParameter("genre") %>" name="genre" /> <input
				type="hidden" value="<%=request.getParameter("author_query") %>" name="author_query" /> <input
				type="hidden" value="<%=request.getParameter("sortBy") %>" name="sortBy" />
                 </form>
                </div>
                <div class="col">
                	<form action="<%=request.getContextPath()%>/addToCart" method="post">
	                	<input type="hidden" name="s" value="<%=id%>"/>
	                	<input type="hidden" name="quick_rent" value="false"/>
	                  	<input type="submit" class="btn btn-danger rounded rounded-pill" value="Add to cart">
	            <input
				type="hidden" value="<%=request.getParameter("s") %>" name="s" /> <input
				type="hidden" value="<%=request.getParameter("genre") %>" name="genre" /> <input
				type="hidden" value="<%=request.getParameter("author_query") %>" name="author_query" /> <input
				type="hidden" value="<%=request.getParameter("sortBy") %>" name="sortBy" />
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