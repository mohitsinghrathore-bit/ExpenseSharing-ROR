class CreateAuditTables < ActiveRecord::Migration[7.0]
  def change
    create_table :audit_tables do |t|
      t.bigint :idUser1
      t.bigint :idUser2
      t.bigint :amount
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
