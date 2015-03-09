FactoryGirl.define do
  factory :groom, class: Person do
  	name "Groom guy"
  end

  factory :bride, class: Person do
  	name "Bride girl"
  end

  factory :wedding do
    groom
    bride
    date {1.year.from_now}
  end

  factory :reference_task do
  	name "Envoyer les photos aux proches"
  	comment nil
  	theme_id 9
  	assigned_person 0
  	wedding_in_12_months 22
  end

  factory :planning do
  	wedding
  end
end