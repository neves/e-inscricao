require 'test_helper'

class RentingTest < ActiveSupport::TestCase

  test "should not save renting without begin date" do
    renting = rentings(:renting)
    renting.begin_date = nil
    assert_not renting.save
    assert_includes renting.errors[:begin_date], "is not a date"
  end

  test "should not save renting without client name" do
    renting = rentings(:renting)
    renting.client_name = nil
    assert_not renting.save
    assert_includes renting.errors[:client_name], "can't be blank"
  end

  test "number of days should be setted do zero if it's nil" do
    renting = rentings(:renting)
    renting.number_of_days = nil
    assert_equal renting.number_of_days, 0
  end

  test "should not save renting if already exists another renting in the same period" do
    renting = rentings(:renting)
    another_renting = rentings(:another_renting)
    another_renting.begin_date = renting.begin_date
    another_renting.number_of_days = (another_renting.end_date - another_renting.begin_date).to_i
    assert_not another_renting.save
    assert_includes another_renting.errors.full_messages, "Período não disponível"
  end

end
