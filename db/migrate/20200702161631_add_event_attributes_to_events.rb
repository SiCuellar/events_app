class AddEventAttributesToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_attributes, :json
  end
end
