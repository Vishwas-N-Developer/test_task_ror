class AddWelcomeEmailSentAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :welcome_email_sent_at, :datetime
    add_index :users, :welcome_email_sent_at
  end
end
