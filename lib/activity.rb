class Activity
  attr_reader :name,
              :participants,
              :cost

  def initialize(name, cost)
    @name = name
    @participants = []
    @cost = cost
  end

  def add_participant(participant)
    @participants << participant
  end

  def cost_per_participant
    @cost / @participants.count
  end

  def amount_owed(participant)
    cost_per_participant - participant.amount_paid
  end
  
end
