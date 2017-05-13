ActiveAdmin.register User do
  permit_params :name,:gender,:dob,:profile_pic,:email,:password


  index do
    selectable_column
    id_column
    column :name
    column :dob
    column :email
    column :gender
    actions
  end

    show do
    attributes_table do
      row :name
      row :dob
      row :email
      row :gender
      row :profile_pic do |user|
        image_tag user.profile_pic.url
      end
    end
    active_admin_comments
  end


  form do |f|
    f.inputs "New User" do
      f.input :name
      f.input :gender
      f.input :dob,as: :datepicker
      f.input :profile_pic
      f.input :email
      f.input :password
      f.input :password_confirmation

    end
    f.actions
  end
end
