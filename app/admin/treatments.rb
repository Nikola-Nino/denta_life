# frozen_string_literal: true

ActiveAdmin.register Treatment do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :full_name, :date_of_visit, :diagnosis, :treatment,
                :special_conditions_and_additional_notes, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :date_of_visit, :diagnosis, :treatment,
  # :special_conditions_and_additional_notes, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
