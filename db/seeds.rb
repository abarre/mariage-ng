# encoding: utf-8
require 'csv'

# User.create!(:email => 'admin@preparer-son-mariage.fr', :password => 'AG2406pix', :password_confirmation => 'AG2406pix')

# link_bdd = [
# 	["cadeaux pour les invités","http://blog.preparer-son-mariage.fr/invites/cadeaux-pour-les-invites/", "Cadeaux pour les invités, conseils et astuces de Préparer Son Mariage"],
# 	["bar à bonbon","http://blog.preparer-son-mariage.fr/bars-a-bonbons/", "Bars à bonbons, conseils et astuces de Préparer Son Mariage"],
# 	["faire-part","http://blog.preparer-son-mariage.fr/invites/faire-part/", "Faire-part, conseils et astuces de Préparer Son Mariage"],
# 	["save the date","http://blog.preparer-son-mariage.fr/save-the-date-pour-prevenir-les-invites-de-la-date-du-mariage/", "Save the Date, conseils et astuces de Préparer Son Mariage"],
# 	["pièce-montée","http://blog.preparer-son-mariage.fr/repas-de-noces/piece-montee/", "Pièce-montée, conseils et astuces de Préparer Son Mariage"],
# 	["dossier de mariage","http://blog.preparer-son-mariage.fr/ceremonie-du-mariage-civil-le-dossier/", "Dossier de mariage, conseils et astuces de Préparer Son Mariage"],
# 	["cérémonie","http://blog.preparer-son-mariage.fr/ceremonie/","Cérémonie, conseils et astuces de Préparer Son Mariage"],
# 	["lieu de la cérémonie","http://blog.preparer-son-mariage.fr/ceremonie-du-mariage-civil-le-lieu-du-mariage/", "Lieu de la cérémonie, conseils et astuces de Préparer Son Mariage"]
# ]

# link_bdd.each do |link_line|
# 	TaskLink.create!(:text => link_line[0], :link => link_line[1], :title => link_line[2])
# end

PERIODS_MAP = {
  "Plus de 12 mois" => :more_than_12_months,
  "11-12 mois avant" => :btw_11_and_12_months,
  "10-11 mois avant" => :btw_10_and_11_months,
  "9 - 10 mois avant" => :btw_9_and_10_months,
  "7 - 8 mois avant" => :btw_7_and_8_months,
  "5 - 6 mois avant" => :btw_5_and_6_months,
  "12 mois avant" => :in_12_months,
  "11 mois avant" => :in_11_months,
  "10 mois avant" => :in_10_months,
  "9 mois avant" => :in_9_months,
  "8 mois avant" => :in_8_months,
  "7 mois avant" => :in_7_months,
  "6 mois avant" => :in_6_months,
  "5 mois avant" => :in_5_months,
  "4 mois avant" => :in_4_months,
  "3 mois avant" => :in_3_months,
  "2 mois avant" => :in_2_months,
  "1 mois avant" => :in_1_month,
  "2 semaines avant" => :in_15_days,
  "1 semaine avant" => :in_1_week,
  "La veille" => :day_before,
  "Le Jour J" => :d_day,
  "Apres le mariage" => :after,
  "no" => :no,
  "terminée" => :finished
}

PERSON_MAP = {
  "MF" => :couple,
  "F" => :bride,
  "M" => :groom
}

CSV.foreach("#{Rails.root}/config/BDD_tasks.csv", :headers => true) do |row|
  csv_task = row.to_hash

  ReferenceTask.create(
  	name: csv_task["Nom"],
  	comment: csv_task["Commentaire"],
    assigned_person: PERSON_MAP[csv_task["Personne"]],
  	theme_id: Theme.find_or_create_by(name: csv_task["Theme"]).id,
  	wedding_in_more_than_12_months: PERIODS_MAP[csv_task["Mariage dans + d'un an"]],
	  wedding_in_12_months: PERIODS_MAP[csv_task["Mariage dans 12 mois"]],
	  wedding_in_11_months: PERIODS_MAP[csv_task["Mariage dans 11 mois"]],
	  wedding_in_10_months: PERIODS_MAP[csv_task["Mariage dans 10 mois"]],
	  wedding_in_9_months: PERIODS_MAP[csv_task["Mariage dans 9 mois"]],
	  wedding_in_8_months: PERIODS_MAP[csv_task["Mariage dans 8 mois"]],
	  wedding_in_7_months: PERIODS_MAP[csv_task["Mariage dans 7 mois"]],
	  wedding_in_6_months: PERIODS_MAP[csv_task["Mariage dans 6 mois"]],
	  wedding_in_5_months: PERIODS_MAP[csv_task["Mariage dans 5 mois"]],
	  wedding_in_4_months: PERIODS_MAP[csv_task["Mariage dans 4 mois"]],
	  wedding_in_3_months: PERIODS_MAP[csv_task["Mariage dans 3 mois"]],
	  wedding_in_2_months: PERIODS_MAP[csv_task["Mariage dans 2 mois"]],
	  wedding_in_1_month: PERIODS_MAP[csv_task["Mariage dans 1 mois"]]
  )
end
print "seeding done"