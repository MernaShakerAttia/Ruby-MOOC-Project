ActiveAdmin.register Lecture do
  permit_params :content, :attachment, :Course_id, :User_id
end
