module ParticipantsHelper
  def shirt_sizes
    { S: :small, M: :medium, L: :large, XL: :xlarge, XXL: :xxlarge }
  end
  
  def shirt_types
    { "V-Neck" => :vneck, "Crew Cut" => :crew }
  end
  
end
