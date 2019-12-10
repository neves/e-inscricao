require 'rails_helper'

RSpec.describe Renting, type: :model do
  it 'should not save renting without begin date' do
    renting = build(:renting)
    renting.begin_date = nil
    expect(renting.save).to be_falsy
    expect(renting.errors[:begin_date]).to include("is not a date")
  end

  it 'should not save renting if end date is before than begin date' do
    renting = build(:renting)
    renting.end_date = renting.begin_date - 1.days
    expect(renting.save).to be_falsy
    expect(renting.errors[:end_date]).to include("must be after or equal to #{renting.begin_date.to_s}")
  end

  it 'should not save renting without client name' do
    renting = build(:renting)
    renting.client_name = nil
    expect(renting.save).to be_falsy
    expect(renting.errors[:client_name]).to include("can't be blank")
  end

  it 'should not save renting if client name length is greater than 50 characters' do
    renting = build(:renting)
    renting.client_name = "a"*51
    expect(renting.save).to be_falsy
    expect(renting.errors[:client_name]).to include("is too long (maximum is 50 characters)")
  end

  it 'number of days should be setted do zero if it\'s nil' do
    renting = build(:renting)
    renting.number_of_days = nil
    expect(renting.number_of_days).to eq(0)
  end

  it 'should not save renting if already exists another renting in the same period' do
    renting = create(:renting)
    another_renting = build(:another_renting)
    another_renting.begin_date = renting.begin_date
    another_renting.number_of_days = (another_renting.end_date - another_renting.begin_date).to_i
    expect(another_renting.save).to be_falsy
    expect(another_renting.errors.full_messages).to include("Período não disponível")
  end
end