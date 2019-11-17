require_relative "plays.rb"
require "sqlite3"

class PlayWrights
    attr_accessor :id, :name, :birth_year

    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
        data.map { |datum| PlayWrights.new(datum) }
    end

    def self.find_by_name(other_name)
        query = <<-SQL, other_name
            SELECT
                *
            FROM
                playwrights
            WHERE
                name = ?
        SQL
    end


    def initialize(id, name, birth_year)
        @id = id
        @name = name
        @birth_year = birth_year
    end

    def create
        raise "#{self} already in database" if self.id
        query = <<-SQL, self.name, self.birth_year
            INSERT INTO
               playwrights (name, birth_year)
            VALUES
                (?, ?)
        SQL
        PlayDBConnection.instance.execute(query)
        self.id = PlayDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        query = <<-SQL, self.name, self.birth_year, self.id
            UPDATE
                playwrights
            SET
                name = ?, birth_year = ?
            WHERE
                id = ?
        SQL
        PlayDBConnection.instance.execute(query)
    end

    def get_plays
        query = <<-SQL, self.id
            SELECT
                title
            FROM
                plays JOIN playwrights ON playwright.id = id
            WHERE
                id = ?
        SQL

        PlayDBConnection.instance.execute(query)
    end

end