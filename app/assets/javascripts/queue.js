$(document).ready(function() {
  $('.availability a.check').click(function(e) {
    var $this = $(this);
    $this.text("Checking...");

    var opts = {
      lines: 11, // The number of lines to draw
      length: 2, // The length of each line
      width: 2, // The line thickness
      radius: 3, // The radius of the inner circle
      corners: 0, // Corner roundness (0..1)
      rotate: 0, // The rotation offset
      color: '#5E7C88', // #rgb or #rrggbb
      speed: 1, // Rounds per second
      trail: 60, // Afterglow percentage
      shadow: false, // Whether to render a shadow
      hwaccel: false, // Whether to use hardware acceleration
      className: 'spinner', // The CSS class to assign to the spinner
      zIndex: 2e9, // The z-index (defaults to 2000000000)
      top: 'auto', // Top position relative to parent in px
      left: 'auto' // Left position relative to parent in px
    };

    var $spinnerSpan = $this.siblings(".spinner");
    $spinnerSpan.spin(opts);
    $spinnerSpan.removeClass("hidden");
  });
});