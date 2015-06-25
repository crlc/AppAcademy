require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = (params.map {|k,v| "#{k} = '#{v}'"}).join(" AND ")
    object = DBConnection.instance.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{where_line}
    SQL

    parse_all(object)
  end
end

class SQLObject
  extend Searchable
end
