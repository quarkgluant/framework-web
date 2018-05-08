# Fichier Rakefile
namespace :db do
  desc "Run migrations"
  task :migrate do |t|
    puts "Migrating…"
    require "sequel"
    Sequel.extension :migration
    connexion = ENV["DATABASE_URL"] || File.read("db/configuration").chomp
    db = Sequel.connect(connexion)
    Sequel::Migrator.run(db, "db/migrations")
    puts "Done."
  end
end