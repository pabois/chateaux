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
//= require jquery.sortable.min

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

  // Image management
  function updateImages() {
    var sortableList = $('.thumbnail-sortable');
    var url = sortableList.data('sort-url');
    var ids = [];
    $('.thumbnail-block', sortableList).each(function() {
      ids.push($(this).data('id'));
    })
    $.ajax({
      type: "POST",
      url: url,
      data: { image_ids: ids }
    });
  }

  // Sortable list of previews
  $('.thumbnail-sortable')
      .sortable( { placeholderClass: 'col-sm-6 col-md-4' } )
      .on('sortupdate', updateImages);

  // Delete button for thumbnails
  $('.thumbnail-sortable .delete').click(function() {
    $(this).parents('.thumbnail-block').remove();
    updateImages();
  });

  // Dropzone customization
  Dropzone.prototype.defaultOptions['headers'] = { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') };
  Dropzone.prototype.defaultOptions['acceptedFiles'] = "image/jpg, image/jpeg, image/png, image/gif";
  Dropzone.prototype.defaultOptions.dictDefaultMessage = "Ajouter des images";
  Dropzone.prototype.defaultOptions.dictFileTooBig = "le fichier est trop gros ({{filesize}}MiB). Poids max : {{maxFilesize}}MiB.";
  Dropzone.prototype.defaultOptions.dictInvalidFileType = "Pas de fichier de ce type.";
  Dropzone.prototype.defaultOptions.dictResponseError = "Le serveur a répondu : {{statusCode}}.";
  Dropzone.prototype.defaultOptions.dictCancelUpload = "Annuler";
  Dropzone.prototype.defaultOptions.dictCancelUploadConfirmation = "Êtes-vous sûr ?";
  Dropzone.prototype.defaultOptions.dictRemoveFile = "Supprimer";

  // Dropable zone
  var myDropzone = new Dropzone(".dropzone");
  myDropzone.on("success", function(file, response) {
    var url = $('.thumbnail-sortable').data('preview-url');
    var id = response.id;
    var jqxhr = $.get(url + id);
  });

});

Dropzone.autoDiscover = false;
