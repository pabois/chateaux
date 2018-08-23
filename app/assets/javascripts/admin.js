//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr

$(function() {
  $('.datepicker').datepicker({
      format: "dd/mm/yyyy",
      language: "fr"
  });
});
