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
        panel "Database Records" do
          render partial: 'db_records'
        end
      end

      column do
        panel "Quiz Scores" do
          render partial: 'scores_chat'
        end
      end
    end

    columns do
      column do
        panel "Login Count" do
          render partial: 'user_login_count'
        end
      end

      column do
        panel "Top 10 Restaurants" do
          puts "!!!!!!!!!!!!!!!!!!"
          restaurants = Restaurant.find_by_sql("SELECT  restaurants.*, AVG(reviews.rating) as avg_rating FROM restaurants INNER JOIN reviews ON reviews.restaurant_id = restaurants.id GROUP BY restaurants.id HAVING (avg_rating > 2) LIMIT 10")
          puts restaurants.inspect
          render partial: 'top_restaurant'
        end
      end
    end
  end
end

def all_models_count
  if ActiveRecord::Base.connection.adapter_name == "Mysql2"
    records = ActiveRecord::Base.connection.execute("
          SELECT TABLE_NAME, TABLE_ROWS
          FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = '#{Rails.configuration.database_configuration[Rails.env]['database']}'
          order by TABLE_ROWS DESC;")

    all_models_count = records.collect{ |row| [row[0], row[1].to_i]}
  else
    records = ActiveRecord::Base.connection.execute("SELECT table_name
                                FROM information_schema.tables
                                WHERE table_type = 'BASE TABLE'
                                AND table_schema NOT IN ('pg_catalog', 'information_schema')
                                ORDER BY table_name ASC;")

    all_models_count = records.collect do |record|
      result = ActiveRecord::Base.connection.execute("SELECT COUNT(*) AS result FROM #{record['table_name']}")
      [record["table_name"], result.getvalue(0,0).to_i]
    end
  end
  all_models_count
end

def total_scores
  users = User.total_scores
  users.map do |user|
    {}.tap do |user_score|
      user_score["name"] = user.name
      user_score["marks"] = user.total_marks
    end
  end
end

def users
  User.all.map do |user|
    {}.tap do |users|
      users[:name] = user.name
      users[:count] = user.sign_in_count
    end
  end
end

def best_restaurants
  Restaurant.best.map do |restaurant|
    {}.tap do |res|
      res[:name] = restaurant.name
      res[:count] = restaurant.avg_rating.round
    end
  end
end
