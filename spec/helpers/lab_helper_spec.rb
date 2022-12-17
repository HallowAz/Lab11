require 'rails_helper'

RSpec.describe LabHelper, type: :helper do
  it 'value 100' do
    expect(described_class.palin_to_h(described_class.palin([100]))).to eql([{"key"=>0, "val"=>100}, {"key"=>1, "val"=>"101"}])
  end

  it 'value 534' do
    expect(described_class.palin_to_h(described_class.palin([534]))).to eql([{"key"=>0, "val"=>534}, {"key"=>1, "val"=>"969"}])
  end

end
