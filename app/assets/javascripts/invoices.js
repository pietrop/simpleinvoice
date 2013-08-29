$(function(){
 $("#invoice_client_id").select2({width: "200px"});
});


$("tr[data-link]").click(function() {
  window.location = this.data("link")
})