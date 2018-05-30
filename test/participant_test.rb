require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/participant'
require './lib/activity'

class ParticipantTest < Minitest::Test
  def test_it_has_attributes
    participant = Participant.new({name: "Jimmy", amount_paid: 50})

    assert_equal "Jimmy", participant.name
  end
end
