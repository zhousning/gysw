# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role = Role.create(:name => Setting.roles.super_admin)
#
admin_permissions = Permission.create(:name => Setting.permissions.super_admin, :subject_class => Setting.admins.class_name, :action => "manage")
#
role.permissions << admin_permissions
#
user = User.new(:phone => Setting.admins.phone, :password => Setting.admins.password, :password_confirmation => Setting.admins.password)
user.save!
#
user.roles = []
user.roles << role
#
#Account.create(:coin => 43241, :status => Setting.accounts.enable, :user_id => user.id)
#
User.create!(:phone => "15763703188", :password => "15763703188", :password_confirmation => "15763703188")
#
AdminUser.create!(:phone => Setting.admins.phone, :email => Setting.admins.email, :password => Setting.admins.password, :password_confirmation => Setting.admins.password)

Lab.create!(:title => "公司简介")
Lab.create!(:title => "组织架构")
#Lab.create!(:title => Setting.reports.ctg_cstr)
#Lab.create!(:title => Setting.reports.ctg_serv)
#Lab.create!(:title => Setting.reports.ctg_know)

Member.create!(:title => "成员队伍")

Result.create!(:title => "我的用水")
Result.create!(:title => "水费查询")
Result.create!(:title => "办理指南")
Result.create!(:title => "服务网点")
Result.create!(:title => "用户报装")
Result.create!(:title => "网上缴费")


#30.times.each do |t|
#  Notice.create!(:title => "通知公告", :content => '测试用', :pdt_date => '2021-10-02')
#  Report.create!(:category => ['0', '1', '2'].sample, :title => "水务新闻", :content => '测试用', :pdt_date => '2021-10-02')
#  Activity.create!(:category => ['0', '1', '2', '3'].sample, :title => "党建工作", :content => '测试用', :pdt_date => '2021-10-02')
#end

Manage.create!(:title => "山东公用水务集团")
Manage.create!(:title => "邹城公用水务有限公司")
Manage.create!(:title => "嘉祥公用水务有限公司")
Manage.create!(:title => "兖州公用水务有限公司")
Manage.create!(:title => "梁山公用水务有限公司")
Manage.create!(:title => "汶上公用水务有限公司")
Manage.create!(:title => "北湖污水处理有限公司")
Manage.create!(:title => "任城污水处理有限公司")
Manage.create!(:title => "达斯玛特水务有限公司")
Manage.create!(:title => "曲阜公用水务有限公司")
Manage.create!(:title => "曲阜圣城供水有限公司")



