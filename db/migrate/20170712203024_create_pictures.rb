class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :filename
      t.string :savefilename

      t.timestamps
    end
  end
end
