class InitialSchema < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.timestamps null: false
    end
    
      create_table :projects_choices do |t|
        t.belongs_to :projects, index:true
        t.string :description
        t.timestamps null: false
      end
    
      create_table :observations do |t|
        t.belongs_to :projects, index:true
        t.string :text_data
        t.timestamps null: false
    end
    
      create_table :observations_classifications do |t|
        t.belongs_to :observations, index:true
        t.belongs_to :projects_choices, index:true
        t.timestamps null: false
    end
    
  end
end