RSpec.shared_context 'contexts/common' do
  let!(:good_action_properties) do
    {
      properties: {
        first_name: 'Pyotr',
        last_name: 'Petrov'
      }
    }
  end

  let!(:bad_action_properties) do
    {
      properties: {
        first_name: 'Pyotr',
        last_name: 'Petrov',
        nested: {
          middle_name: 'Petrovich'
        }
      }
    }
  end
end