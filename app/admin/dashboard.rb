ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    #    div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #      span :class => "blank_slate" do
    #        span "Welcome to Active Admin. This is the default dashboard page."
    #        small "To add dashboard sections, checkout 'app/admin/dashboards.rb'"
    #      end
    #    end

    columns do
      column do

        puts "############################"
        puts "POSTGRESQL"

        records = ActiveRecord::Base.connection.execute("SELECT table_name
                                FROM information_schema.tables
                                WHERE table_type = 'BASE TABLE'
                                AND table_schema NOT IN ('pg_catalog', 'information_schema')
                                ORDER BY table_name ASC;")

        all_models_count = records.collect do |record|
          [record["table_name"], ActiveRecord::Base.connection.execute("SELECT COUNT(*) AS result FROM #{record['table_name']}")]
        end

        puts "ALL MODELS COUNT"
        puts all_models_count.inspect

        records = ActiveRecord::Base.connection.execute("
          SELECT TABLE_NAME, TABLE_ROWS
          FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = '#{Rails.configuration.database_configuration[Rails.env]['database']}'
          order by TABLE_ROWS DESC;")

        all_models_count = records.collect{ |row| [row[0], row[1].to_i]}

        max = all_models_count.first[1].to_f
        percent = 100.00/max

        panel "Database Records" do
          recs = ''
          all_models_count.each do |model_name, count|
            bar_size = percent*count
            bar_size = 2 if bar_size < 2 and bar_size > 0

            recs << "<div width='100px'>"
            recs << link_to("#{model_name.tableize} - #{count}", "/admin/#{model_name.tableize}") rescue nil
            recs << "<div class=\"progress progress-info\">"
            recs << "<div class=\"bar\" style=\"width: #{bar_size}%\">"
            recs << "</div>"
            recs << "</div>"
            recs << "</div>"
          end
          recs.html_safe
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end

      end
    end
  end
end
