$(document).ready(function(){
  $("tr[data-link]").click(function() {
    debugger
    window.location = $(this).data("link")
  })
});