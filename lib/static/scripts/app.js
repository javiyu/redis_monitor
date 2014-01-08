$(document).ready(function(){
  $('.selectpicker').selectpicker();
  $('#database_select').change(function(){
    $(this).closest('form').submit();
  });
});