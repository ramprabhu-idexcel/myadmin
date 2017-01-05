ActiveAdmin.register AdminUser do
  config.sort_order = 'created_at_asc'
  permit_params :first_name, :last_name, :username, :email, :age, :address, :phone, :password, :password_confirmation, :is_admin

  index do
    selectable_column
    column :name
    column :username
    column :email
    column :age
    column :address
    column :phone
    column :is_admin
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
  filter :is_admin

  form do |f|
    f.inputs "Admin Details" do
      f.input :first_name
      f.input :last_name
      f.input :username
      f.input :is_admin
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :age
      f.input :address
      f.input :phone
    end
    f.actions
  end

  controller do
    def update
      if params[:admin_user][:password].blank? && params[:admin_user][:password_confirmation].blank?
        params[:admin_user].delete("password")
        params[:admin_user].delete("password_confirmation")
      end
      super
    end
  end
end
