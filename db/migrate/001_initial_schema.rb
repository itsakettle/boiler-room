class InitialSchema < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.timestamps null: false
    end
    
      create_table :choices do |t|
        t.belongs_to :project, index:true
        t.string :description
        t.timestamps null: false
      end
    
      create_table :observations do |t|
        t.belongs_to :project, index:true
        t.string :text_data
        t.timestamps null: false
    end
    
      create_table :classifications do |t|
        t.belongs_to :observation, index:true
        t.belongs_to :choice, index:true
        t.timestamps null: false
    end
    
  end
end