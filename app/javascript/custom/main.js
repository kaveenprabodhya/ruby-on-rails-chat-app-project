$(".message .close").on("click", function () {
  $(this).closest(".message").transition("fade");
});

$(".ui.dropdown").dropdown();

if ($("#messages").length > 0) {
  $("#messages").animate({ scrollTop: $("#messages")[0].scrollHeight }, 1000);
}

// $("#session_body").on("keydown", function (e) {
//   if (e.keyCode == 13) {
//     e.target.value = "";
//   }
// });
