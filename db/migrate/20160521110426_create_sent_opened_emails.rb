class CreateSentOpenedEmails < ActiveRecord::Migration
  def change
    create_table :sent_opened_emails do |t|
      t.string :email
      t.string :ip_address
      t.string :opened

      t.timestamps null: false
    end
  end
end
