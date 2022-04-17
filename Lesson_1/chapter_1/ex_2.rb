module Walk
  def walk_fast
    puts "I am walking fast....>>>"
  end
end

class GoodCat
  include Walk
end


puss = GoodCat.new

puss.walk_fast