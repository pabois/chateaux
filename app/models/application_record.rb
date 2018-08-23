class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.has_one_attached_deletable(name, dependent: :purge_later)
    class_eval do
      attr_accessor :"#{name}_delete"

      before_validation { send(name).purge if send("#{name}_delete") == 'true' }

      define_method :"#{name}_delete=" do |value|
        instance_variable_set :"@#{name}_delete", value
      end
    end

    # TODO pass dependent correctly
    has_one_attached name
  end
end
