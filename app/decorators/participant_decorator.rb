class ParticipantDecorator < Draper::Decorator
  delegate_all

  def free_form
    false
  end

  def fieldset
    :info
  end

  def fieldsets
    [:info, :tshirt, :payment, :confirm]
  end

end
