			</main>

			<!-- Main content -->

		</div>
	</div>




	<script>
		function previewImage(event) {
			var input = event.target;
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var preview = document.getElementById('preview');
					preview.src = e.target.result;
					preview.style.display = 'block';
				};
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>