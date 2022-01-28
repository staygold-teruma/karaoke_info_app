crumb :root do
  link "HOME", root_path
end

crumb :topic_index do
  link "トピックス一覧", users_topics_path
  parent :root
end

crumb :fee_guide_result do
  link "料金案内結果", edit_fee_guide_path
  parent :root
end

crumb :topic_show do
  link "トピックス詳細", users_topics_path
  parent :topic_index
end

crumb :coupon do
  link "クーポン", static_pages_coupon_path
  parent :root
end

crumb :alcohol do
  link "飲み放題", static_pages_alcohol_plan_path
  parent :root
end

crumb :fee_table do
  link "料金表", static_pages_fee_table_path
  parent :root
end

crumb :user_sign_in do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :user_sign_up do
  link "ユーザー登録", new_user_registration_path
  parent :root
end

crumb :user_password_reset do
  link "パスワード再設定"
  parent :user_sign_in
end

crumb :user_show do |user|
  link "マイページ", user_path(user)
  parent :root
end

crumb :user_edit do |user|
  link "ユーザー編集"
  parent :user_show, user
end

crumb :shop_index do |_user|
  link "店舗検索", shops_path
  parent :root
end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
