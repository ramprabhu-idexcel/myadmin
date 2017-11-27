ActiveAdmin.register EmployeeRole do
  menu parent: "Employee Management", label: "Roles"

  permit_params :name

  index title: "Roles" do
    selectable_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs "Employee Designation Details" do
      f.input :name
    end
    f.actions
  end
end
