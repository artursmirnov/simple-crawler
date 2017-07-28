require 'rails_helper'

RSpec.describe 'Pages API', type: :request do

  let(:pages) { create_list(:page, 5) }
  let(:page_id) { pages.first.id }

  describe 'GET /pages' do
    before { get '/pages' }

    it 'returns pages' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

end
