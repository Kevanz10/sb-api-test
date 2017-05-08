class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    TokenProvider.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password, :role

  def user
    user = User.find_by_email(email)  
    if user && user.authenticate(password)
      return user 
    else
      errors.add :user_authentication, 'Invalid credentials, try again.'
    end
    nil
  end
end