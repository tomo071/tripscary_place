ActiveAdmin.register Information do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body, :user_id, :latitude, :longitude, :address
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :user_id, :latitude, :longitude, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :title

  index do
    selectable_column
    id_column
    column :title
    column :body

    actions
  end
end
