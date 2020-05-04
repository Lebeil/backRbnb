class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.belongs_to :listing, index: true
      t.references :host, index: true
      t.references :guest, index: true

      t.timestamps
    end
  end
end
