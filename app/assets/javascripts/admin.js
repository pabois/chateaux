//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr
//= require pace/pace.min.js
//= require metisMenu/jquery.metisMenu.js
//= require slimscroll/jquery.slimscroll.min.js
//= require toastr/toastr.min
//= require inspinia
//= require inspinia_file

$(function() {
  $('.datepicker').datepicker({
      format: "dd/mm/yyyy",
      language: "fr"
  });
});
