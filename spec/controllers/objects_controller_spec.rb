require 'rails_helper'

describe Api::V1::ObjectsController, type: :controller do
  context 'actions' do
    include_context 'contexts/common'
    it 'Fetches decision tree' do
      get :fetch_tree

      expect(response).to_not have_any_error
    end
  end
end
