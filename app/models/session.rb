class Session < ActiveRecord::Base

  attr_accessor :name, :password, :admin

  belongs_to :admin

  before_validation :authenticate_admin

  validates_presence_of :admin, :message => 'Invalid username / password combination!'

  before_save :begin_session

  private

  def authenticate_admin
    unless self.admin
      self.admin = Admin.match(self.password)
    end
  end

  def begin_session     
    self.admin_id ||= self.admin.id
  end
  
  def self.mass_fields
    [:password]
  end

end
