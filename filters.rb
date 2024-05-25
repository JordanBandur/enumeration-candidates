require './candidates'

# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    @candidates.find { |candidate| candidate[:id] == id }
  end
  
  def experienced?(candidate)
    if candidate[:years_of_experience] >= 2
    end
  end
  
  def qualified_candidates(candidates)
    results = candidates.select do |candidate|
      experienced?(candidate) && 
      has_required_github_points?(candidate) &&
      knows_required_languages?(candidate) &&
      applied_within_days?(candidate, 15) &&
      is_of_required_age?(candidate)
    end
    return results
  end

  def ordered_by_qualifications(candidates)
    candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  end
  
  # More methods will go below

  def has_required_github_points?(candidate) 
    candidate[:github_points] >= 100
  end

  def knows_required_languages?(candidate)
    candidate[:languages].include?("Ruby") || 
    candidate[:languages].include?("Python")
  end

  def applied_within_days?(candidate, days) 
    candidate[:date_applied] <= 15.days.ago.to_date
  end

  def is_of_required_age?(candidate) 
    candidate[:age] >= 18
  end



