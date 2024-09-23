<script>
$( document ).ready(function() {
  function move_sidebar() {
    var w = window.innerWidth;
    if (w < 768) {
      $("#TOC").appendTo($("#quarto-sidebar .sidebar-menu-container"));
    } else {
      $("#TOC").appendTo($("#quarto-margin-sidebar"));
    }
  }
  move_sidebar();
  window.onresize = move_sidebar;
});
</script>
