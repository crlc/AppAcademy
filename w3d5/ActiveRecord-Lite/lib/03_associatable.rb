require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    "#{class_name}".constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    send "foreign_key=", options[:foreign_key] || "#{name}_id".to_sym
    send "class_name=", options[:class_name] || "#{name}".camelcase
    send "primary_key=", options[:primary_key] || :id

  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    send "foreign_key=", options[:foreign_key] || "#{self_class_name.downcase}_id".to_sym
    send "class_name=", options[:class_name] || "#{name}".camelcase.singularize
    send "primary_key=", options[:primary_key] || :id

  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options ||= BelongsToOptions.new(name, options = {})

    options.each do |k, v|
      define_method k do
        send k
      end
    end
  end

  def has_many(name, options = {})
    # options = HasManyOptions.new(name, name, options = {})
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
