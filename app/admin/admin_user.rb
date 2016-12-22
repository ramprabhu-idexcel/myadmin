ActiveAdmin.register AdminUser do
  permit_params :first_name, :last_name, :username, :email, :age, :address, :phone, :password, :password_confirmation

  index do
    selectable_column
    column :first_name
    column :last_name
    column :username
    column :email
    column :age
    column :address
    column :phone
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :username
  filter :email
  filter :age
  filter :address
  filter :phone
  filter :sign_in_count

  form do |f|
    f.inputs "Admin Details" do
      f.input :first_name
      f.input :last_name
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :age
      f.input :address
      f.input :phone
    end
    f.actions
  end

end
