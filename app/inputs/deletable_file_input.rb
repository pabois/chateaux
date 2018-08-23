class DeletableFileInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    format('<div class="fileinput %s input-group" data-provides="fileinput">
          <div class="form-control" data-trigger="fileinput">
            <i class="glyphicon glyphicon-file fileinput-exists"></i>
            <span class="fileinput-filename">%s</span>
          </div>
          <span class="input-group-addon btn btn-default btn-file">
            <span class="fileinput-new">Choisir</span>
            <span class="fileinput-exists">Modifier</span>
            <input type="hidden" name="%s" class="delete_switch" />
            %s
          </span>
          <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Supprimer</a>
        </div>
      ', input_filled, input_value, input_hidden_name, input_field).html_safe
  end

  def input_filled
    unless @builder.object.send(attribute_name).attached?
      "fileinput-new"
    else
      "fileinput-exists"
    end
  end

  def input_hidden_name
    "#{@builder.object_name}[#{attribute_name.to_s}_delete]"
  end

  def input_value
    file_instance.filename if @builder.object.send(attribute_name).attached?
  end

  def file_instance
    @builder.object.send(attribute_name)
  end

  def input_field
    required = input_html_options[:required]
    required = false if @builder.object.send(attribute_name).attached?
    accept = input_html_options[:accept]

    template.file_field_tag(
        "#{@builder.object_name}[#{attribute_name}]",
        id: "#{@builder.object_name}_#{attribute_name}",
        class: "fileinput-hidden",
        required: required,
        accept: accept
      )
  end
end
