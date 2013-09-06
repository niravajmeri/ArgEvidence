class CreateArgumentEvidences < ActiveRecord::Migration
  def change
    create_table :argument_evidences do |t|
      t.string :argument_id
      t.string :number
      t.string :evidence_id
      t.string :number

      t.timestamps
    end
  end
end
