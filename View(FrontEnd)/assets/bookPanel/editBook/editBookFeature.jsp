<div class="row accordion-body accordion-collapse collapse"
						id="editBook" data-bs-parent="#arkCONTENT">
						<div>
							<header>
								<h1 class="fs-1">Edit Book</h1>
							</header>
							<hr class="bg-secondary my-1 opacity-100">



							<div class="container col align-items-center">

								<!-- Search -->
								<div class="row my-5">
									<div class="col">Search Book</div>
									<div class="col">
										<!-- Input search box -->
										<!-- Will autofill -->
										<input id="login-password" type="input" name="password"
											placeholder="Search Book"
											class="btn border border-secondary-subtle" required>

										<input id="login-password" type="button" name="password"
											value="Select Picture"
											class="btn border border-secondary-subtle" required>

									</div>
								</div>



								<!-- Picture -->
								<div class="row my-5">
									<div class="col">Picture</div>
									<div class="col">
										<input id="login-password" type="button" name="password"
											value="Change Picture"
											class="btn border border-secondary-subtle" required>
									</div>
								</div>

								<!-- Title -->
								<div class="row my-5">
									<div class="col">Title</div>
									<div class="col">
										<input class="form-control" placeholder="Title"
											id="floatingTextarea">
									</div>
								</div>

								<!-- Author -->
								<div class="row my-5">
									<div class="col">Author</div>
									<div class="col">
										<input class="form-control" placeholder="Author"
											id="floatingTextarea">
									</div>
								</div>

								<!-- Details -->
								<!-- To show display of number of characters -->
								<div class="row my-5">
									<div class="col">Description</div>
									<div class="col">
										<textarea class="form-control"
											placeholder="Add a description for the book here"
											id="floatingTextarea2" style="height: 100px"
											style="resize: none;" maxlength="255" onchange="countText()"></textarea>
										<span class="pull-right label label-default"
											id="count_message"></span>

									</div>
								</div>

								<div class="row my-5">
									<div class="col">Price</div>
									<div class="col">
										<input class="form-control" placeholder="$"
											id="floatingTextarea">
									</div>
								</div>

								<div class="row my-5">
									<div class="col">ISBN Code</div>
									<div class="col">
										<input class="form-control" placeholder="ISBN-13"
											id="floatingTextarea">
									</div>
								</div>

								<div class="row  my-5">
									<div class="col">Genre</div>

									<!-- To autofill using JSP -->
									<div class="dropdown col">
										<div class="row mx-1">
											<a class="btn btn-danger dropdown-toggle col-3" href="#"
												role="button" data-bs-toggle="dropdown"
												aria-expanded="false"> Select genre </a>

											<ul class="dropdown-menu ">
												<li><a class="dropdown-item" href="#">Action</a></li>
												<li><a class="dropdown-item" href="#">Another
														action</a></li>
												<li><a class="dropdown-item" href="#">Something
														else here</a></li>
											</ul>

											<div class="col-6">test</div>

										</div>

									</div>

								</div>

							</div>
							<div>
								<input type="submit" value="Add book" class="btn btn-primary">

							</div>

						</div>

					</div>