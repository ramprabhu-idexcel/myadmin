Restaurant = Mygem::Restaurant
Review = Mygem::Review
User = Mygem::User
[
  Restaurant,
  Review,
  User
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
