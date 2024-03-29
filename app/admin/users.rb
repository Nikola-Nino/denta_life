# frozen_string_literal: true

ActiveAdmin.register User do
  controller do
    include ApplicationHelper
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password, :password_confirmation,
                :first_name, :last_name, :date_of_birth, :phone, :username, :role
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,
  # :first_name, :last_name, :date_of_birth, :phone, :username]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :email
      f.input :username
      f.input :first_name
      f.input :last_name
      f.input :date_of_birth
      f.input :phone
      f.select :role, collection: available_roles
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
