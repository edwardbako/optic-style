class AddTsvectorToClients < ActiveRecord::Migration[5.1]
  def up
    add_column :clients, :tsv, :tsvector
    add_index :clients, :tsv, using: 'gin'
    execute <<-SQL
      CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
      ON clients FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(
        tsv, 'pg_catalog.english', first_name, last_name
      );
    SQL

    now = Time.current.to_s(:db)
    update("UPDATE clients SET updated_at = '#{now}'")
  end

  def down
    execute <<-SQL
      DROP TRIGGER tsvectorupdate
      ON clients
    SQL

    remove_index :clients, :tsv
    remove_column :clients, :tsv
  end

end
