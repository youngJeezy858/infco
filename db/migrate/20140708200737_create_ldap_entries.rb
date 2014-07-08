class CreateLdapEntries < ActiveRecord::Migration
  def change
    create_table :ldap_entries do |t|
      t.string :name

      t.timestamps
    end
  end
end
