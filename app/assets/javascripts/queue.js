$(document).ready(function() {
  $('.availability a.check').click(function(e) {
    var $this = $(this);
    $this.text("Searching...");
  });
});