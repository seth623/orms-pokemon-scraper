class Pokemon

    attr_reader :id 
    attr_accessor :name, :type, :db 

    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db 
    end

    def self.find(id, db)

        sql = <<-SQL
        SELECT * 
        FROM pokemon
        WHERE id == ?;
        SQL
        pokemon_data = db.execute(sql, id)[0]
        
        pokemon_object = self.new(id: id, name: pokemon_data[1], type: pokemon_data[2], db: db)

        pokemon_object 

    end 
    
    def self.save(name, type, db)

        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?);
        SQL

        db.execute(sql, name, type)

    end 

end
