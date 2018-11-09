RSpec.shared_context 'contexts/common' do
  let!(:good_action_properties) do
    {
      first_name: 'Pyotr',
      last_name: 'Petrov'
    }
  end

  let!(:good_action_properties2) do
    {
      first_name: 'Ivan',
      last_name: 'Ivanov',
      language: 'Russian'
    }
  end

  let!(:good_action_properties3) do
    {
      first_name: 'Dmitriy',
      last_name: 'Ivanov',
      language: 'Russian'
    }
  end

  let!(:bad_action_properties) do
    {
      first_name: 'Pyotr',
      last_name: 'Petrov',
      nested: {
        middle_name: 'Petrovich'
      }
    }
  end

  let!(:action1) do
    Action.create(id: 1, properties: good_action_properties)
  end

  let!(:action2) do
    Action.create(id: 2, properties: good_action_properties2)
  end

  let!(:action3) do
    Action.create(id: 3, properties: good_action_properties3)
  end

  let!(:tree) do
    {
      key: "last_name",
      values: {
        Petrov: {
          key: "first_name",
          values: {
            Pyotr: [1]
          },
          default: []
        },
        Ivanov: {
          key: "language",
          values: {
            Russian: {
              key: "first_name",
              values: {
                Ivan: [2],
                Dmitriy: [3]
              },
              default: []
            }
          },
          default: []
        }
      },
      default: []
    }
  end
end