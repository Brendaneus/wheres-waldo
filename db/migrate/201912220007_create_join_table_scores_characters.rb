class CreateJoinTableScoresCharacters < ActiveRecord::Migration[6.0]
  def change
    create_join_table :scores, :characters do |t|
      t.index [:score_id, :character_id]
    end
  end
end
