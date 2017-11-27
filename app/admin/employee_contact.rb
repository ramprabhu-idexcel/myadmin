ActiveAdmin.register EmployeeContact do
  menu parent: "Employee Management", label: "Contacts"

  config.clear_action_items!

  permit_params :type, :office_email, :personal_email,
                :mobile_no, :alternate_no, :landline, :door_no,
                :street, :city, :state, :pincode, :emergency_contact_name,
                :emergency_contact_no, :person_id


  index title: "Contacts" do
    selectable_column
    column "Emp Name" do |contact|
      contact.employee.name
    end
    column :office_email
    column :personal_email
    column :mobile_no
    column :alternate_no
    column :landline
    column :door_no
    column :street
    column :city
    column :state
    column :pincode
    column :emergency_contact_name
    column :emergency_contact_no
    actions
  end

  filter :office_email
  filter :personal_email
  filter :mobile_no
  filter :alternate_no
  filter :landline
  filter :door_no
  filter :street
  filter :city
  filter :state
  filter :pincode
  filter :emergency_contact_name
  filter :emergency_contact_no

  form do |f|
    f.inputs "Contact Details" do
      f.input :office_email
      f.input :personal_email
      f.input :mobile_no
      f.input :alternate_no
      f.input :landline
      f.input :door_no
      f.input :street
      f.input :city
      f.input :state
      f.input :pincode
      f.input :emergency_contact_name
      f.input :emergency_contact_no
      if f.object.new_record?
        f.input :person_id, :input_html => { :value => (Employee.find(params[:person_id]).id rescue nil) }, as: :hidden
      end
    end
    f.actions
  end

  controller do
    def create
      super
    end
  end
end