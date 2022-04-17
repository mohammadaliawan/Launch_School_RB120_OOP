def get_name
  str = str.capitalize
end

def some_method(get_name)
  @name = get_name
end

p some_method("hello")