class AddConfirmableToDevise < ActiveRecord::Migration



  def change
    change_table(:users) do |t|
     

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

 
      ## Token authenticatable
       t.string :authentication_token


      # Uncomment below if timestamps were not included in your original model.
     # t.timestamps
    end

    
     add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
     add_index :users, :authentication_token, :unique => true
  end

end
