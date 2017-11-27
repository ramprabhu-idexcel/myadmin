Restaurant = Mygem::Restaurant
Review = Mygem::Review
User = Mygem::User
AdminComment = Mygem::AdminComment
Quiz = Mygem::Quiz
Computer = Mygem::Computer
Gk = Mygem::Gk
Score = Mygem::Score
Project = Mygem::Project
Task = Mygem::Task
Ip = Mygem::Ip
Employee = Mygem::Employee
EmployeeRole = Mygem::EmployeeRole
Contact = Mygem::Contact
EmployeeContact = Mygem::EmployeeContact
[
  Restaurant,
  Review,
  User,
  AdminComment,
  Quiz,
  Computer,
  Gk,
  Score,
  Project,
  Task,
  Ip,
  Employee,
  EmployeeRole,
  Contact,
  EmployeeContact
].each do |klass|
  klass.instance_eval do
    def to_s
      super.demodulize
    end

    def name
      super.demodulize
    end
  end
end

EmployeeContact.class_eval do
  after_save :deliver_email

  def deliver_email
    EmployeesMailer.welcome_email(self.id).deliver_later
  end
end
