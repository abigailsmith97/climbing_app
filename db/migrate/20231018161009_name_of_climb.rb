class NameOfClimb < ActiveRecord::Migration[7.1]
  def change
    add_column :entries, :link, :string
  end
end
