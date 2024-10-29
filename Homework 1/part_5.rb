# Define a method attr_accessor_with_history that provides the same functionality as attr accessor but also tracksevery value the attribute has ever had

class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader "#{attr_name}_history"
    class_eval %Q{
      def #{attr_name}=(value)  # Setter
        @#{attr_name}_history ||= [nil] # Inicializa o array com nil caso ele não exista
        @#{attr_name}_history << value  # Adiciona o valor ao array
        @#{attr_name} = value # Atribui o valor ao atributo
      end
    }
  end
end

# Testando a funcionalidade com a classe Foo
class Foo
  attr_accessor_with_history :bar
end

# Casos de teste
f = Foo.new
f.bar = 1
f.bar = 2
p f.bar_history # => [nil, 1, 2]
