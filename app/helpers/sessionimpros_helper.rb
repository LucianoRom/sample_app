module SessionimprosHelper
def impro_admin?(user)
   user.type_id == 2
end
end
