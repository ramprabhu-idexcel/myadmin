ActiveAdmin.register Employee do
  menu :parent => "Employee Management"

  permit_params :emp_id, :first_name, :last_name, :gender, :dob,
                :place_of_birth, :office_email, :personal_email,
                :joining_date, :designation, :salary,
                :total_experience, :citizenship, :manager_id


  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :gender
    column :dob
    column "age" do |employee|
      employee.age
    end
    column :place_of_birth
    column :office_email
    column :personal_email
    column :joining_date
    column :designation
    column :manager
    column :salary
    column :total_experience
    column :citizenship
    actions
  end

  filter :first_name
  filter :last_name
  filter :gender
  filter :dob
  filter :place_of_birth
  filter :office_email
  filter :personal_email
  filter :joining_date
  filter :designation
  filter :manager
  filter :salary
  filter :total_experience
  filter :citizenship


  form do |f|
    f.inputs "Employee Details" do
      f.input :first_name
      f.input :last_name
      f.input :gender, as: :select, collection: Employee::GENDER, include_blank: false
      f.input :dob, include_blank: false, as: :datepicker
      f.input :place_of_birth
      f.input :office_email
      f.input :personal_email
      f.input :joining_date, include_blank: false, as: :datepicker
      f.input :designation
      f.input :manager, as: :select, collection: Employee.all.each { |emp| emp.name }, include_blank: "Please Select"
      f.input :salary
      f.input :total_experience
      f.input :citizenship
    end
    f.actions
  end
end