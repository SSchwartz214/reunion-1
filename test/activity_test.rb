require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/participant'

class ActivityTest < Minitest::Test

  def test_it_has_a_type
    activity = Activity.new("golfing")


    assert_equal "golfing", activity.name
  end

  def test_it_can_add_participants
    activity = Activity.new("golfing")
    participant_1 = Participant.new({name: "Jimmy", amount_paid: 50})
    participant_2 = Participant.new({name: "John", amount_paid: 50})

    activity.add_participant(participant_1)

    assert_equal 1, activity.participants.count
    assert_equal "Jimmy", activity.participants.last.name

    activity.add_participant(participant_2)

    assert_equal 2, activity.participants.count
    assert_equal "John", activity.participants.last.name
  end

end
