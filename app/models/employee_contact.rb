class EmployeeContact < Mygem::EmployeeContact
  after_save :deliver_email

  def deliver_email
    EmployeesMailer.welcome_email(self.id).deliver_later
  end
end
