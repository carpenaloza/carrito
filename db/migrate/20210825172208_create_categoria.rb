class CreateCategoria < ActiveRecord::Migration[6.1]
  def change
    create_table :categoria do |t|
      t.string :categoria

      t.timestamps
    end
  end
end
