require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/participant'

class ActivityTest < Minitest::Test

  def test_it_has_a_name
    activity = Activity.new("golfing", 100)


    assert_equal "golfing", activity.name
    assert_equal 100, activity.cost
  end

  def test_it_can_add_participants
    activity = Activity.new("golfing", 100)
    participant_1 = Participant.new({name: "Jimmy", amount_paid: 50})
    participant_2 = Participant.new({name: "John", amount_paid: 50})

    activity.add_participant(participant_1)

    assert_equal 1, activity.participants.count
    assert_equal "Jimmy", activity.participants.last.name

    activity.add_participant(participant_2)

    assert_equal 2, activity.participants.count
    assert_equal "John", activity.participants.last.name
  end

  def test_it_has_cost_per_participant
    activity = Activity.new("golfing", 100)
    participant_1 = Participant.new({name: "Jimmy", amount_paid: 50})
    participant_2 = Participant.new({name: "John", amount_paid: 50})

    activity.add_participant(participant_1)
    activity.add_participant(participant_2)

    assert_equal 50, activity.cost_per_participant
  end

  def test_it_can_calculate_amount_owed
    activity = Activity.new("golfing", 100)
    participant_1 = Participant.new({name: "Jimmy", amount_paid: 75})
    participant_2 = Participant.new({name: "John", amount_paid: 25})

    activity.add_participant(participant_1)
    activity.add_participant(participant_2)

    assert_equal 25, activity.amount_owed(participant_1).abs
  end
end
