class TypeException < Exception ;end
class MyAncestry

  def initialize(objs, options={})
    validate_objs(objs)
    @objs = objs
    load_default_options(options)
  end

  def load_default_options(options)
    @id = options[:id] || "id"
    @ancestry_id = options[:ancestry_id] || "ancestry_id"
    @objects_type = @objs.first.class.name
    @comparision_type = options[:comparision_type] || "to_i"
  end

  def all 
    @objs
  end

  def search
    @objs.select do
      yield
    end
  end

  #Search parent by id of child
  def parent_of(id)
    item = find_by_id(id)
    find_by_id(eval(comparision_childrem_value("item")))
  end

  #Search all childrem by ancestry_id
  def childrem_of(id)
    @objs.select do |obj| 
      eval(comparision_childrem_value("obj")).to_i == id.to_i
    end
  end

  #Search all brothers of id
  def brothers_of(id)
    parent = parent_of(id)
    childrem_of(eval(comparision_obj_value("parent")))
  end

  #Search a object by id
  def find_by_id(id)
    @objs.select {|obj| eval(comparision_obj_value("obj")).to_i == id.to_i}.first
  end

  def validate_objs(objs)
    first_class_name = objs.first.class.name
    objs.each do |obj|
       raise TypeException.new "The list of objets must be a single type" unless first_class_name == obj.class.name
    end
  end

  private 

  def comparision_childrem_value(var)
    comparision_value(var,@ancestry_id)
  end

  def comparision_obj_value(var)
    comparision_value(var,@id)
  end

  def comparision_value(var,id)
    items = {
      "Array" => "#{var}[#{id}]",
      "Hash"  => "#{var}[ #{type_value(id)} ]",
      "Symbol" => "#{var}[#{type_value(id)}]",
    }
    if items.key?(@objects_type)
      items[@objects_type]
    else
      "#{var}.#{id}"
    end
  end

  def type_value(var)
    items ={
      "String" => var,
      "Symbol" => ":#{var}",
    }
    items[var.class.name]
  end

end