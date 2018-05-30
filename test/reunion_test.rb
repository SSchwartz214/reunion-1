require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'mocha/minitest'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_has_attributes
    reunion = Reunion.new("Miami")

    assert_equal "Miami", reunion.location
  end

  def test_it_can_have_activities
    reunion = Reunion.new("Miami")
    # activity_1 = Activity.new("Golf", 100)
    # activity_2 = Activity.new("Surfing", 50)

    # activity_1 = mock
    # # activity_2 = mock

    activity_1 = stub(:name => "Golf", :cost => 50 )
    activity_2 = stub(:cost => "Surfing")

    reunion.add_activity(activity_2)
    reunion.add_activity(activity_1)

    # assert_equal 1, reunion.activities.count
    assert_equal "Golf", reunion.activities.last.name

    assert_equal 2, reunion.activities.count
    assert_equal 50, reunion.activities.last.cost
  end

  def test_it_can_calculate_total_cost
    reunion = Reunion.new("Miami")
    activity_1 = Activity.new("Golf", 100)
    activity_2 = Activity.new("Surfing", 50)

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)

    assert_equal 150, reunion.total_cost([activity_1, activity_2])
  end

  def test_it_can_calculate_amount_owed
    reunion = Reunion.new("Miami")
    activity_1 = Activity.new("Golf", 100)
    activity_2 = Activity.new("Surfing", 50)
    participant_1 = Participant.new({name: "Jimmy", amount_paid: 100})
    participant_2 = Participant.new({name: "John", amount_paid: 50})

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)

    activity_1.add_participant(participant_1)
    activity_2.add_participant(participant_2)

    assert_equal 50, reunion.amount_owed(participant_1).abs
  end
end
