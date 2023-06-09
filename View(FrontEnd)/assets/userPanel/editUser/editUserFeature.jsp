<div class="row accordion-body accordion-collapse collapse"
						id="editUser" data-bs-parent="#arkCONTENT">
						<div>
							<header>
								<h1 class="fs-1">Edit User</h1>
							</header>
							<hr class="bg-secondary my-1 opacity-100">



							<div class="container col align-items-center">

								<div class="row my-5">
									<div class="col">Search User</div>
									<div class="col">
										<!-- Input search box -->
										<!-- Will autofill -->
										<input id="login-password" type="input" name="password"
											placeholder="Search User"
											class="btn border border-secondary-subtle" required>

										<input id="login-password" type="button" name="password"
											value="Select User"
											class="btn border border-secondary-subtle" required>

									</div>
								</div>


								<!-- Picture -->
								<div class="row my-5">
									<div class="col">Picture</div>
									<div class="col">
										<input id="login-password" type="button" name="password"
											value="Change Picture"
											class="btn border border-secondary-subtle">
									</div>
								</div>

								<!-- Email -->
								<div class="row my-5">
									<div class="col">Email</div>
									<div class="col">
										<input class="form-control" placeholder="Email"
											id="floatingTextarea">
									</div>
								</div>

								<!-- Password -->
								<div class="row my-5">
									<div class="col">Password</div>
									<div class="col">
										<input class="form-control" placeholder="Password"
											id="floatingTextarea">
									</div>
								</div>





								<div class="row  my-5">
									<div class="col">Role</div>

									<!-- To autofill using JSP -->
									<div class="dropdown col">
										<div class="row mx-1">
											<a class="btn btn-danger dropdown-toggle col-3" href="#"
												role="button" data-bs-toggle="dropdown"
												aria-expanded="false"> Select Role </a>

											<ul class="dropdown-menu ">
												<li><a class="dropdown-item" href="#">User</a></li>
												<li><a class="dropdown-item" href="#">Admin</a></li>

											</ul>

											<div class="col-6">test</div>

										</div>

									</div>

								</div>


							</div>
							<div>
								<input type="submit" value="Edit User" class="btn btn-primary">

							</div>

						</div>
					</div>