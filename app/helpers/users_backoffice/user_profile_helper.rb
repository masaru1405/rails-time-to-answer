module UsersBackoffice::UserProfileHelper

   def gender_select(user, current_gender)
      user.user_profile.gender == current_gender ? 'btn-primary' : 'btn-default'
   end

   def avatar_url
      avatar = current_user.user_profile.avatar
      avatar.attached? ? avatar : "profile.jpg"
   end
end
