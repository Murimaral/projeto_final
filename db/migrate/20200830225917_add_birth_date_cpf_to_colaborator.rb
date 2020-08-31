class AddBirthDateCpfToColaborator < ActiveRecord::Migration[6.0]
  def change
    add_column :colaborators, :birth_date, :date
    add_column :colaborators, :cpf, :string
  end
end
