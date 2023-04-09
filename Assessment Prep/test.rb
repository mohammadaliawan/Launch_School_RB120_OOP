class Company
  attr_accessor :staff

  def initialize(members)
    @staff = members
  end

  def +(other_company)
    temp_comp = Company.new()
    temp_comp.staff = staff + other_company.staff
    temo_comp
  end

end

worley = Company.new(["Bob", "Tom"])
wood = Company.new(["kitty", "perry"])

new_company = worley + wood

p new_company.staff