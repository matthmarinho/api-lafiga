class ChangeTeamColorToString < ActiveRecord::Migration[6.0]
  def change
    change_table :teams do |t|
      t.change :color, :string
    end
  end
end
