require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
	test "usuario vacío" do
		@user = User.new()
		assert !@user.save(), "El usuario se creó vacío"
	end

   # test "presencia de atributos" do
   # 		@user = User.new()
   # 		@user.nombre = "Pepe"
   # 		assert !@user.save(), "El usuario se creó sólo con el nombre"
  	# 	@user.apellido = "Santori"
  	# 	assert !@user.save, "El usuario se creó sólo con nombre y apellido"
  	# 	@user.idiomasNativos = "Español"
  	# 	assert !@user.save, "El usuario se creó sólo con nombre, apellido e idiomaNativo"
  	# 	@user.idiomasAAprender = "Inglés"
  	# 	assert !@user.save, "El usuario se creó sólo con nombre, apellido e idiomas"
  	# 	@user.email = "xxx@gmail.com"
  	# 	assert !@user.save, "El usuario se creó sin password"
  	# 	@user.encrypted_password = User.new.send(:password_digest, 'xxx')
  	# 	assert user.save(), "El password no fue encriptado correctamente"
   # end

   test "formato de mail" do
   		@user = User.new();
     	@user.nombre = "Pepe"
  		@user.apellido = "Santori"
  		@user.idiomasNativos = "Español"
  		@user.idiomasAAprender = "Inglés"
  		@user.email = "xxx"
  		@user.encrypted_password = User.new.send(:password_digest, 'xxx')
     	assert !@user.save(), "El usuario se creó con un formato de mail inválido"
   end

end
