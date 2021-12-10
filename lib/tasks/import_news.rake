require 'yaml'
require 'logger'
require 'find'
require 'creek'

#$0 <img src="/newsfolder/党建$2021-11-11$书记上党课.docx资源/$0.png" />
namespace 'db' do
  desc "import news"
  task(:import_news => :environment) do
    base_dir = File.join(Rails.root, "public", "newsfoldercache")

    Find.find(base_dir).each do |txtpath|
      if !FileTest.directory?(txtpath)
        extn = File.extname(txtpath)

        p_start = "<p style='font-size:20px;text-indent: 35px;line-height: 35px;'>"
        p_end = "</p>"

        if extn == '.txt'
          name = File.basename txtpath, extn
          arr = name.split('$')
          type = arr[0].strip
          date = arr[1].strip
          title = arr[2].strip

          img_start = "<p style='line-height: 35px;'><img src='/newsfolder/" + name + ".docx资源/"
          img_end = ".png' /></p>"
          content = ""
          File.open(txtpath, "r") do |file|
            file.each_line do |line|
              result = line.gsub!(/\$\d/) do |match| 
                img_start + match + img_end
              end
              if result.nil?
                content += p_start + line + p_end
              else
                content += result
              end
            end
          end

          if type == "水务"
            Report.create(:category => Setting.reports.ctg_cstr_id, :pdt_date => date, :title => title, :content => content)
          elsif type == "员工"
            Report.create(:category => Setting.reports.ctg_serv_id, :pdt_date => date, :title => title, :content => content)
          elsif type == "知识"
            Report.create(:category => Setting.reports.ctg_know_id, :pdt_date => date, :title => title, :content => content)
          elsif type == "分公司党建"
            Activity.create(:category => Setting.activities.ctg_org_id, :pdt_date => date, :title => title, :content => content)
          elsif type == "集团党建"
            Activity.create(:category => Setting.activities.ctg_cmpt_id, :pdt_date => date, :title => title, :content => content)
          else
            puts title + 'without category'
          end
        end
      end
    end
  end
end
