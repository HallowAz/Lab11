require 'rails_helper'

RSpec.describe "Labs", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/lab/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    context 'when params are not valid' do
      it "returns http success" do
        get "/lab/show"
        expect(response).to have_http_status(302)
      end

      it 'initializes invalid values do' do
        get "/lab/show", params: {numb: "Hello"}
        expect(assigns(:res)).to eq(nil)
      end

      it 'initializes unpositive values do' do
        get "/lab/show", params: {numb: -45}
        expect(assigns(:res)).to eq(nil)
      end
    end

    context 'when params are correct' do
      before { get "/lab/show", params: { numb: 100 } }

      it 'retrns status code 200' do 
        expect(response).to have_http_status(200)
      end

      it 'initializes correct values do' do
        expect(assigns(:res)).to eq([{"key"=>0, "val"=>"100"}, {"key"=>1, "val"=>"101"}])
      end
      
      it 'renders input template' do
        expect(response).to render_template(:show)
      end
    end

  end

  
end
