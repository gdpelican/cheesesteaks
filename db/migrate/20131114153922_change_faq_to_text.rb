class ChangeFaqToText < ActiveRecord::Migration
  def change
    change_column :faqs, :answer, :text
  end
end
