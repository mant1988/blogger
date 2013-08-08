namespace :bg do

  desc "destroy and rebuild the database"
  task :nuke_and_pave => ["db:drop", "db:create", "db:migrate", "db:seed", "bg:seed:default", "test:prepare"]

  namespace :seed do

    desc "Creates a articles, comments and tags"
    task :default => [:create_article]

    task :create_article => :environment do
      puts 'Creating 3 Articles'
      Article.create!({:title => "About my life", :body => "All of my life is awesome becasue i love to live"})
      Article.create!({:title => "About my job", :body => "My job is quite good, but i must take a time to practices"})
      Article.create!({:title => "Noting to write", :body => "Love to live and learn is quite good"})
    end
  end
end