module AdminsTemplateHelper

   def translate_attribute(object, method)
      if object && method
         object.model.human_attribute_name(method) 
      else
         "Informe os parâmetro corretamente."
      end
   end
   
end
