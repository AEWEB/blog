require 'csv'
require 'active_record/fixtures'

ActiveRecord::Base.establish_connection(Rails.env.to_sym)

SEED_DIR = File.join(Rails.root, 'db', 'seeds')

def files_for(table_names)
  if table_names.empty?
    puts("-------")
    Dir.glob(File.join(SEED_DIR, '*.{yml,csv}'))
  else
    table_names.inject({}) do |files, table_name|
      pattern = File.join(SEED_DIR, "#{table_name}.{yml,csv}")
      files + Dir.glob(pattern)
    end
  end
end

# TODO: csv読み込みも一応用意したがノーテスト
def read_csv_file(file_path)
  CSV.parse(IO.read(file_path))
end

def read_yaml_file(file_path)
  rows = YAML.load(render(IO.read(file_path))).values
  header = rows.first.keys
  rows = rows.map {|row| row.values_at(*header)}
  rows.unshift(header)
end

def render(content)
  ERB.new(content).result
end

def insert_rows(klass, rows)
  header = rows.shift.map(&:strip)
  ActiveRecord::Base.transaction do
    until rows.blank?
      r = rows.slice!(0, 1000)
      klass.import(header, r, :on_duplicate_key_update => header -["id", "created_at"])
    end
  end
end

def import_admin_users
  file_name = "admin_user"
  puts "-- #{file_name}"
  files =  Dir.glob(File.join(SEED_DIR, "#{file_name}.{yml,csv}"))

  rows = []
  files.each do |file|
    rows = read_yaml_file(file)
  end
  
  rows.each do |row| 
    r = row.slice!(0, 1000)
    AdminUser.create( email: r[0], password: r[1], password_confirmation: r[1] )
  end
end

def main
  table_names = ENV['TABLES'] ? ENV['TABLES'].split(',') : []
  exclude_table_names = ENV['EXCLUDE_TABLES'] ? ENV['EXCLUDE_TABLES'].split(',') : []
  exclude_table_names.push("admin_user")
  bulk = ENV['BULK'].to_i == 1
  files = files_for(table_names)
  
  files.each do |fixture_file|

    table_name = File.basename(fixture_file, '.*')
    next if table_name.in?(exclude_table_names)
    ActiveRecord::Migration.say_with_time(table_name) do
      begin
        if bulk
          case File.extname(fixture_file)
          when ".csv"
            klass = table_name.classify.constantize
            rows = read_csv_file(fixture_file)
            insert_rows(klass, rows)
          when ".yml", ".yaml"
            klass = table_name.classify.constantize
            rows = read_yml_file(fixture_file)
            insert_rows(klass, rows)
          end
        else
          ActiveRecord::Fixtures.create_fixtures('db/seeds', table_name)
        end
      rescue Exception => e
        message = "ERROR: #{e.message}"
        STDERR.puts(message)
      end
    end
  end
  
end

main

ActiveRecord::Base.establish_connection(Rails.env.to_sym)