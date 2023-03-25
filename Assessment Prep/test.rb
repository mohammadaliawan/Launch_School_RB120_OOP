class ProjectTeam
  attr_accessor :members

  def initialize
    @members = []
  end

end

class Engineer
end

class ProjectManager
end

class AdminStaff
end

team1 = ProjectTeam.new
bob = Engineer.new
jim = ProjectManager.new
sara = AdminStaff.new

team1.members.push(bob, jim, sara)

p team1