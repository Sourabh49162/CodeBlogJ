$(document).ready(
	function() {
		let flag = false;
		$("#editBtn").click(function() {
			if (flag === false) {
				$("#profile_details").hide();
				$("#profile_edit").show();
				$(this).text("Update");
				$(this).removeClass("btn-primary");
				$(this).addClass("btn-warning");
				flag = true;
			} else {
				$("#profile_details").show();
				$("#profile_edit").hide();
				update();
				$(this).text("Edit");
				$(this).removeClass("btn-warning");
				$(this).addClass("btn-primary");
				flag = false;
			}
		});

		function update() {
			let form = new FormData(document
				.getElementById("update_form"));
			$.ajax({
				url: "Update",
				type: "POST",
				data: form,
				success: function(data, textStatus, jqXHR) {
					console.log("SUCCESS")
					/* $("#reg_form").show();
					$("#loader").hide();
					if(data.trim() === "Registration Successful") {
						swal(data, " We are redirecting you to Login Page...", "success")
						.then((value) => {
							  window.location = "login.jsp";
						}); 
					} else if(data.trim() === "Something Went Wrong! Please try after sometime..."){
						swal("Sorry!", data, "error")
					} else {
						swal("Sorry!", data, "warning")
					} */
					window.location = "profile.jsp";
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log("ERROR");
					/* $("#reg_form").show();
					$("#loader").hide();
					swal("Sorry!", "Something Went Wrong! Please try Again...", "error")
					 */
				},
				processData: false,
				contentType: false
			});
		}

		$("#add-post-btn").click(function() {
			addPost();
		});

		function addPost() {
			let form = new FormData(document.getElementById("add-post-form"));
			console.log(form.get("title"))
			$.ajax({
				url: "AddPost",
				type: "POST",
				data: form,
				success: function(data, textStatus, jqXHR) {
					if (data.trim() === "done") {
						swal("Good Job!", "Post Saved Successfully", "success").then((value) => {
							$("#close-modal").click();
							$("#add-post-form").trigger("reset");
						});
					} else {
						swal("Sorry!", "Something Went Wrong", "error");
					}
				}, error: function(jqXHR, textStatus, errorThrown) {
					swal("Sorry!", "Something Went Wrong", "error");
				},
				processData: false,
				contentType: false
			});
		}

	});