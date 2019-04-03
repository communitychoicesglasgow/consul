namespace :budgets do
  namespace :email do

    desc "Sends emails to authors of selected investments"
    task selected: :environment do
      Budget.last.email_selected
    end

    desc "Sends emails to authors of unselected investments"
    task unselected: :environment do
      Budget.last.email_unselected
    end

  end

<<<<<<< HEAD
=======
  namespace :phases do
    desc "Generates Phases for existing Budgets without them & migrates description_* attributes"
    task generate_missing: :environment do
      Budget.where.not(id: Budget::Phase.all.pluck(:budget_id).uniq.compact).each do |budget|
        Budget::Phase::PHASE_KINDS.each do |phase|
          Budget::Phase.create(
            budget: budget,
            kind: phase,
            description: budget.send("description_#{phase}"),
            prev_phase: budget.phases&.last,
            starts_at: budget.phases&.last&.ends_at || Date.current,
            ends_at: (budget.phases&.last&.ends_at || Date.current) + 1.month
          )
        end
      end
    end
  end

  namespace :groups do
    desc "Apply default voting style (knapsack) to budget groups"
    task update_voting_style: :environment do
      Budget::Group.update_all(voting_style: 'knapsack')
    end
  end

>>>>>>> bc25f2617daf86baafc3138aef0da83bf1c611f5
end
