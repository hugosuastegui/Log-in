class User < ActiveRecord::Base
  # Remember to create a migration!
      # ej. User.authenticate('fernando@codea.mx', 'qwerty')

  def self.authenticate(email, password)
    # si el email y el password corresponden a un usuario valido, regresa el usuario
    # de otra manera regresa nil
    user = User.find_by(email: email)
    if user.nil?
      return nil
    elsif user.password == password
      return user
    end
  end
end
