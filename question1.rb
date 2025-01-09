# Online Ruby Compiler (Interpreter)
class User
  attr_accessor :first_name, :last_name, :email
  attr_reader :status, :user_type

  STATUSES = %i[pending active passive].freeze
  USER_TYPES = %i[admin user].freeze

  def initialize(first_name:, last_name:, email:, status: :active, user_type: :user)
    raise ArgumentError, 'First name cannot be nil' if first_name.nil? || first_name.strip.empty?
    raise ArgumentError, 'Last name cannot be nil' if last_name.nil? || last_name.strip.empty?

    @first_name = first_name
    @last_name = last_name
    self.email = email
    self.status = status
    self.user_type = user_type
  end

  def info
    "Full Name: #{full_name} - Email: #{email} - Status: #{status} - User Type: #{user_type}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def active?
    status == :active
  end

  def admin?
    user_type == :admin
  end

  private

  def email=(email)
    raise ArgumentError, "Invalid email format. Email must contain '@'" unless email.include?('@')

    @email = email.downcase
  end

  def status=(status)
    raise ArgumentError, "Invalid status: #{status}. Allowed: #{STATUSES.join(', ')}" unless STATUSES.include?(status)

    @status = status
  end

  def user_type=(user_type)
    unless USER_TYPES.include?(user_type)
      raise ArgumentError, "Invalid user type: #{user_type}. Allowed: #{USER_TYPES.join(', ')}"
    end

    @user_type = user_type
  end
end

user = User.new(first_name: '', last_name: 'Doe', email: 'john@doe.com')

puts user.info
