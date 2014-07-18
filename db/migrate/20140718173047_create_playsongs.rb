class CreatePlaysongs < ActiveRecord::Migration
  def change
    create_table :playsongs do |t|
	    t.references :playlist, index: true
      	t.references :song, index: true
	    t.timestamps
    end
  end
end
