class DecisionTreeBuilder

  def initialize
    @actions = Action.all
  end

  def build
    tree_for_actions(@actions, [])
  end

  private

  def tree_for_actions(actions, path)
    keys = actions.collect { |a| a.properties.keys }.flatten.uniq - path
    if key = keys.shift
      grouped_actions = actions.group_by { |a| a.properties[key] }
      grouped_values  = grouped_actions.keys.reject(&:nil?)
      default_actions = grouped_actions.delete(nil) || []

      {
        key: key,
        values: Hash[
          grouped_values.map { |val| [ val, tree_for_actions(grouped_actions.delete(val), path + [key]) ] }
        ],
        default: tree_for_actions(default_actions, path + [key])
      }
    else
      actions.pluck(:id)
    end
  end

end