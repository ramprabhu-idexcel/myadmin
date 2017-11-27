ActiveAdmin.register Employee do
  menu :parent => "Employee Management"

  permit_params :emp_id, :first_name, :last_name, :gender, :dob,
                :place_of_birth, :joining_date, :designation_id, :salary,
                :total_experience, :citizenship, :manager_id

  index do
    selectable_column
    column "emp ID", :id
    column :first_name
    column :last_name
    column :gender
    column :dob
    column 'age' do |employee|
      employee.age
    end
    column :place_of_birth
    column :joining_date
    column :designation
    column "Reporting Manager", :manager
    column 'salary' do |employee|
      employee.salary_with_precision
    end
    column :total_experience
    column :citizenship
    actions do |employee|
      if employee.employee_contact.present?
        action = admin_employee_contact_path(employee.employee_contact)
      else
        action = new_admin_employee_contact_path(person_id: employee.id)
      end
      link_to 'Contact', action
    end
  end

  filter :first_name
  filter :last_name
  filter :gender
  filter :dob
  filter :place_of_birth
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
      f.input :joining_date, include_blank: false, as: :datepicker
      f.input :designation, as: :select, collection: EmployeeRole.all.each { |role| role.name }, include_blank: "Please Select"
      f.input :manager, label: "Reporting Manager", as: :select, collection:
          Employee.all.each { |emp| emp.name }, include_blank: "Please Select"
      f.input :salary
      f.input :total_experience
      f.input :citizenship
    end
    f.actions
  end
end