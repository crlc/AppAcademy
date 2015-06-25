require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    result = DBConnection.instance.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      LIMIT
        0
    SQL
    results = result.first.map do |el|
      el.to_sym# attributes[el.to_sym] = nil
    end
    results
  end

  def self.finalize!
    columns.each do |attribute|
      define_method(attribute) do
        attributes[attribute]
      end

      define_method("#{attribute}=") do |val|
        attributes[attribute] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || "#{self}".tableize
  end

  def self.all
    results = DBConnection.instance.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.map do |k|
      self.new(k)
    end
  end

  def self.find(id)
    results = DBConnection.instance.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        id = ?
      LIMIT
        1
    SQL

    parse_all(results).first
  end

  def initialize(params = {})
    params.each do |attr_name,value|
      attr_name = attr_name.to_sym
      unless self.class.columns.include?(attr_name)
        raise "unknown attribute '#{attr_name}'"
      else
        self.send "#{attr_name}=", value
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |val|
      send(val)
    end
  end

  def insert
    col_names = self.class.columns.join(",")
    question_marks = (["?"] * self.class.columns.length).join(",")

    result = DBConnection.instance.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    send :id=, DBConnection.instance.last_insert_row_id
  end

  def update
    col_names = self.class.columns.map {|val| "#{val} = ?"}.join(",")
    result = DBConnection.instance.execute(<<-SQL, *attribute_values)
      UPDATE
        #{self.class.table_name}
      SET
        #{col_names}
      WHERE
        id = #{attribute_values.first}
    SQL
  end

  def save
    if attribute_values.first.nil?
      insert
    else
      update
    end
  end
end
