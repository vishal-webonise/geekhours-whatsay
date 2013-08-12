# module FindHelper
#   module ClassMethods
#     def get_by_id(id)
#       Self.where(:_id=>id).first
#     end
#   end

#   def self.included(base)
#     base.extend ClassMethods
#   end
# end

# class ActiveRecord::Base
#   include FindHelper
# end