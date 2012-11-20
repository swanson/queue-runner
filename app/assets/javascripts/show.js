$(document).ready(function() {
  $("#new-show form").submit(function(e) {
    $("#new-show").spin({top: "180px"});
  });

  $(".show-title").click(function(e) {
    var icon = $(this).find("i");

    if (icon.hasClass("icon-chevron-right")) {
      icon.removeClass("icon-chevron-right")
          .addClass("icon-chevron-down");
    } else {
      icon.removeClass("icon-chevron-down")
          .addClass("icon-chevron-right");
    }
  });
});