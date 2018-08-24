//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr
//= require jasny-bootstrap
//= require toastr
//= require jquery_nested_form
//= require dropzone

$(function() {

  // init datepicker field
  $('.datepicker').datepicker({
      format: "dd/mm/yyyy",
      language: "fr"
  });

  // events for deletable_file fields
  $('.fileinput')
  .on('clear.bs.fileinput', function() {
    $('input[type="hidden"]:not(.delete_switch)', this).remove();
    $('.delete_switch', this).val('true');
  })
  .on('change.bs.fileinput', function() {
    $('.delete_switch', this).val('');
  });

  // Dropzone customization
  Dropzone.prototype.defaultOptions['headers'] = { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') };
  Dropzone.prototype.defaultOptions.dictDefaultMessage = "Ajouter des images";
  Dropzone.prototype.defaultOptions.dictFileTooBig = "le fichier est trop gros ({{filesize}}MiB). Poids max : {{maxFilesize}}MiB.";
  Dropzone.prototype.defaultOptions.dictInvalidFileType = "Pas de fichier de ce type.";
  Dropzone.prototype.defaultOptions.dictResponseError = "Le serveur a répondu : {{statusCode}}.";
  Dropzone.prototype.defaultOptions.dictCancelUpload = "Annuler";
  Dropzone.prototype.defaultOptions.dictCancelUploadConfirmation = "Êtes-vous sûr ?";
  Dropzone.prototype.defaultOptions.dictRemoveFile = "Supprimer";

});
