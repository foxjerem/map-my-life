class AddTypeToTargetModel < ActiveRecord::Migration
  def change
    add_column :targets, :type, :string
  end
end
