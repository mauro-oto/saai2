require 'test_helper'

class ListTest < ActiveSupport::TestCase
	test "lista vacía" do
    	assert !List.new().save(), "Se guardó una lista vacía"
  	end

  	test "presencia de atributos" do
    	@list = List.new()
      @list.nombre = "x"
    	@list.idiomaForaneo = "x"
    	assert !@list.save(), "Se guardó una lista sin idiomaNativo"
    	@list = List.new()
    	@list.idiomaNativo = "x"
    	assert !@list.save(), "Se guardó una lista sin nombre"
    	@list = List.new().nombre = "x"
    	@list.idiomaNativo = "x"
    	assert !@list.save(), "Se guardó una lista sin idiomaForaneo"
  	end

  	test "guardar" do
    	@list = List.new().nombre = "x"
    	@list.idiomaForaneo = "x"
    	@list.idiomaNativo = "x"
    	assert @list.save(), "No se pudo guardar la lista"
  	end
end
