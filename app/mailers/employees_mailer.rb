class EmployeesMailer < ApplicationMailer
  def welcome_email(contact_id)
    @employee_contact = EmployeeContact.find(contact_id)
    @email = @employee_contact.office_email
    @url  = "employee-management.com"
    @name = @employee_contact.employee.name
    mail(to: @email, subject: "Welcome to Capgemini") do |format|
      format.html
    end
  end
end
