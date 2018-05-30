class Participant
  attr_reader :name,
              :amount_paid

  def initialize(data)
    @name = data[:name]
    @amount_paid = data[:amount_paid]
  end

end
