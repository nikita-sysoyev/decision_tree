require 'rails_helper'

describe Api::V1::ObjectsController, type: :controller do
  context 'actions' do
    include_context 'contexts/common'
    it 'Fetches decision tree' do
      get :fetch_tree

      expect(response.status).to be 200
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq tree
    end
  end
end
