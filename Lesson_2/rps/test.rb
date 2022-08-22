













    @age = age
    @members = []
    @name = name
    @name = name
    age > other_person.age
    members.push person
    members[idx]
    members[idx] = obj
    temp_team
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
  attr_accessor :name, :age
  attr_accessor :name, :members
  def +(other_team)
  def <<(person)
  def >(other_person)
  def [](idx)
  def []=(idx, obj)
  def initialize(name)
  def initialize(name, age)
  end
  end
  end
  end
  end
  end
  end
6cvyqcctxsj[cpe][st1dctr
class Person
class Team
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)
cowboys << Person.new("Troy Aikman", 48)
cowboys = Team.new("Dallas Cowboys")
dream_team = cowboys + niners
dream_team.name = "Dream Team"
dream_team[4]
dream_team[5] = Person.new("JJ", 72)
end
end
niners << Person.new("Deion Sanders", 47)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Joe Montana", 59)
niners = Team.new("San Francisco 49ers")
puts dream_team.members.inspect