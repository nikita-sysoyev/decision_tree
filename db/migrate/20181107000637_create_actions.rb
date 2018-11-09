class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.jsonb :properties
    end
  end
end
