require 'rails_helper'

RSpec.describe 'Pages API', type: :request do

  let!(:pages) { create_list(:page, 5) }
  let(:page_id) { pages.first.id }

  describe 'GET /pages' do

    before { get '/pages' }

    it 'returns pages' do
      expect(json).not_to be_empty
      expect(json['pages'].size).to eq(pages.size)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'contains url in response' do
      expect(json['pages'].first['url']).not_to be_empty
    end

  end

  describe 'GET /pages/:id' do

    before { get "/pages/#{page_id}" }

    context 'when the record exists' do

      it 'returns the page' do
        expect(json).not_to be_empty
        expect(json['page']['id']).to eq(page_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when the record does not exist' do

      let(:page_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find/)
      end

    end

  end

  describe 'POST /pages' do

    let(:valid_attributes) { { page: { url: 'http://github.com/' } } }

    context 'when the request is valid' do

      before { post '/pages', params: valid_attributes }

      it 'creates a page' do
        expect(json['page']['url']).to eq('http://github.com/')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end

    context 'when the request is invalid' do

      before { post '/pages', params: { page: { url: 'Foobar' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end

    end

  end

  describe 'DELETE /pages/:id' do

    before { delete "/pages/#{page_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

  end

end
