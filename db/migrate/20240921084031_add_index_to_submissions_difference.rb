class AddIndexToSubmissionsDifference < ActiveRecord::Migration[7.2]
  def change
    add_index :submissions, :difference
  end
end
