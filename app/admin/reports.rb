ActiveAdmin.register Report do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :comment_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :comment_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :user_id, :comment_id
  index do
    selectable_column
    id_column
    column :user
    column :comment do |report |
      report.comment.information.body
      link_to report.comment.body, admin_comment_path(report.comment.id)
    end
    actions
  end
  show do
    attributes_table do
      row :comment do | report |
        link_to report.comment.body, admin_comment_path(report.comment.id)
      end
      row :user do | report|
        link_to report.user.name, admin_user_path(report.user.id)
      end
    end
  end
  # index do |report|
  #   attributes_table(*author.class.columns.collect { |column| column.name.to_sym })
  #   panel "通報一覧" do
  #     table_for Report.find_by(id: params.require(:report_id)).comment do
  #       column :comment
  #       column :publish_date
  #     end
  #   end
  # end
end
