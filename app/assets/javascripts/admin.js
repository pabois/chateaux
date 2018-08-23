//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr
//= require jasny-bootstrap
//= require toastr

$(function() {
  $('.datepicker').datepicker({
      format: "dd/mm/yyyy",
      language: "fr"
  });

  $('.fileinput')
  .on('clear.bs.fileinput', function() {
    $('input[type="hidden"]:not(.delete_switch)', this).remove();
    $('.delete_switch', this).val('true');
  })
  .on('change.bs.fileinput', function() {
    $('.delete_switch', this).val('');
  });

});
