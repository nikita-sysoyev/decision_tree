require 'rails_helper'

describe Api::V1::ActionsController, type: :controller do
  context 'actions' do
    include_context 'contexts/common'
    it 'Creates action' do
      post :create, params: good_action_properties

      expect(response).to_not have_any_error
      expect(Action.count).to be 1
      expect(Action.first.properties).not_to be nil
    end
  end
end
