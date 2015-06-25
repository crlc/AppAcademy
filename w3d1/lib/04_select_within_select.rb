# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# A note on subqueries: we can refer to values in the outer SELECT within the
# inner SELECT. We can name the tables so that we can tell the difference
# between the inner and outer versions.

def example_select_with_subquery
  execute(<<-SQL)
    SELECT
      name
    FROM
      countries
    WHERE
      population > (
        SELECT
          population
        FROM
          countries
        WHERE
          name='Romania'
        )
  SQL
end

def larger_than_russia
  # List each country name where the population is larger than 'Russia'.
  execute(<<-SQL)
    SELECT
      name
    FROM
      countries
    WHERE
      population > (
        SELECT
          population
        FROM
          countries
        WHERE
          name = 'Russia'
      )
  SQL
end

def richer_than_england
  # Show the countries in Europe with a per capita GDP greater than
  # 'United Kingdom'.
  execute(<<-SQL)
    SELECT
      name
    FROM
      countries
    WHERE
      (gdp / population) > (
        SELECT
          gdp / population
        FROM
          countries
        WHERE
          name = 'United Kingdom'
      )  AND continent = 'Europe'
  SQL
end

def neighbors_of_b_countries
  # List the name and continent of countries in the continents containing
  # 'Belize', 'Belgium'.
  execute(<<-SQL)

  SELECT
    name, continent
  FROM
    countries
  WHERE
    continent IN (
      SELECT
        continent
      FROM
        countries
      WHERE
        name IN ('Belize', 'Belgium')
    )

  SQL
end

def population_constraint
  # Which country has a population that is more than Canada but less than
  # Poland? Show the name and the population.
  execute(<<-SQL)
    SELECT
      name, population
    FROM
      countries
    WHERE
      population > (
        SELECT
          population
        FROM
          countries
        WHERE
          name IN ('Canada')
      ) AND population < (
        SELECT
          population
        FROM
          countries
        WHERE
          name IN ('Poland')
      )
  SQL
end

def sparse_continents
  # Find each country that belongs to a continent where all populations are
  # less than 25,000,000. Show name, continent and population.
  execute(<<-SQL)
    SELECT
      name, continent, population
    FROM
      countries
    WHERE
      continent NOT IN (
        SELECT
          continent
        FROM
          countries
        WHERE
          population > 25000000
      )
  SQL
end
