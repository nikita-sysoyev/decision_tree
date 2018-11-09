require 'rails_helper'

describe Api::V1::ActionsController, type: :controller do
  context 'create' do
    include_context 'contexts/common'
    it 'Fails to create action' do
      post :create, params: { properties: bad_action_properties }

      expect(response.status).to be 400
    end

    it 'Creates action' do
      post :create, params: { properties: good_action_properties }

      expect(response.status).to be 200
      expect(Action.last.properties).not_to be nil
    end
  end

  context 'update' do
    include_context 'contexts/common'
    it 'Fails to update action' do
      put :update, params: { id: action1.id, properties: bad_action_properties }

      expect(response.status).to be 400
    end

    it 'Updates action' do
      put :update, params: { id: action1.id, properties: good_action_properties }

      expect(response.status).to be 200
      expect(Action.last.properties).not_to be nil
    end
  end
end
