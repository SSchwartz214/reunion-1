require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_has_attributes
    reunion = Reunion.new("Miami")

    assert_equal "Miami", reunion.location
  end

  def test_it_can_have_activities
    reunion = Reunion.new("Miami")
    activity_1 = Activity.new("Golf", 100)
    activity_2 = Activity.new("Surfing", 50)

    reunion.add_activity(activity_1)

    assert_equal 1, reunion.activities.count
    assert_equal "Golf", reunion.activities.last.name

    reunion.add_activity(activity_2)

    assert_equal 50, reunion.activities.last.cost
  end
end
