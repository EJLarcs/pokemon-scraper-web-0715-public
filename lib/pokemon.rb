class Pokemon

 def initialize(pokename, poketype, db)
   @pokename = pokename
   @poketype = poketype
   @db = db
   #initialize with a name and type of your pokemon and the database you are going to add to
 end

 def save
   array = [[@pokename, @poketype]]
   #store the pokemon name and type within a nested array
   #nest the array to ensure that the name and type remain linked
   ins = @db.prepare('INSERT INTO pokemon (name, type) VALUES (?, ?)')
   #PREPARE YOUR SQL
   #prepare your database using .prepare
   #call your SQL in this as an argument
   #use the values '?' as opposed to set values - this is because we wont know these until the class
   #is initialized
   array.each { |s| ins.execute(s)}
   #EXECUTE YOU DATABASE AND INSERT CORRECT DATA
   #iterate over the array you created and execute your database(with SQL argument)
   #this will then apply the prepare code on the class instance
 end

 def self.save(name, type, db)
   Pokemon.new(name, type, db).save
   #call save on self so ensure that the save method is completed when a class is initialized
 end

end
