require 'rails_helper'

RSpec.describe Result, type: :model do
  describe "model" do
    context "Adding" do
      it 'adding 1' do
      res = Result.create!(number: 100, arr: "[{\"key\"=>0, \"val\"=>\"100\"}, {\"key\"=>1, \"val\"=>\"101\"}]")
      expect(Result.find_by(number:100)). to eq(res)
      end

      it 'adding 2' do
        res = Result.create!(number: 6421, arr: "[{\"key\"=>0, \"val\"=>\"6421\"}, {\"key\"=>1, \"val\"=>\"7667\"}]")
        expect(Result.find_by(number:6421)). to eq(res)
      end
    end

    it 'checking for unrepeatable' do
      res = Result.create!(number: 100, arr: "[{\"key\"=>0, \"val\"=>\"100\"}, {\"key\"=>1, \"val\"=>\"101\"}]")
      expect(Result.create(number: 100, arr: "[{\"key\"=>0, \"val\"=>\"100\"}, {\"key\"=>1, \"val\"=>\"101\"}]").valid?).to eq(false)
    end
  end
end
