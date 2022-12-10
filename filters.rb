# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each{|candidate|
    if(candidate[:id]==id)
      return candidate
    end
  }
  return nil
end

def experienced?(candidate)
  return candidate[:years_of_experience]>2
end

def qualified_candidates(candidates)
  qualified=Array.new
  @candidates.each{|candidate|
    if(experienced?(candidate) &&
      candidate[:github_points]>=100 &&
      candidate[:languages].any?{|i| ['Ruby', 'Python'].include? i} &&
      (DateTime.now.to_date-candidate[:date_applied])<=15 &&
      candidate[:age] >= 18
  )
      qualified << candidate
    end
  }
  return qualified
end

# More methods will go below
def ordered_by_qualifications(candidates)
  candidates.sort{|x,y|
    if(x[:years_of_experience]!=y[:years_of_experience])
      y[:years_of_experience]<=>x[:years_of_experience]
    else
      y[:github_points]<=>x[:github_points]
    end
  }
end
