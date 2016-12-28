Restaurant = Mygem::Restaurant
Review = Mygem::Review
User = Mygem::User
AdminComment = Mygem::AdminComment
[
  Restaurant,
  Review,
  User,
  AdminComment
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
