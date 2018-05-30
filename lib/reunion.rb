class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost(activities)
    activities.inject(0) {|sum, activity| sum += activity.cost}
  end

  def amount_owed(participant)
    total_cost(activities) - participant.amount_paid
  end
end
