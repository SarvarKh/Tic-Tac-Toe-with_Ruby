class Player
  def initialize(name)
    @name = name
  end

  def name_valid?(name)
    unless name == ''
      puts 'Invalid name, enter another name'
      @name = gets.chomp
      name_valid?(@name)
    end
  end
end