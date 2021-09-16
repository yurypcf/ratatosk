class CreateMonitorings < ActiveRecord::Migration[6.1]
  def change
    create_table :monitorings do |t|
      t.string :service_title
      t.string :service_address
      t.text :warning_message
      t.boolean :status

      t.timestamps
    end
  end
end
