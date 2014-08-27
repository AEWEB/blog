class User < ActiveRecord::Base
  require 'digest/md5'
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :mail,
    :uniqueness => {:case_sensitive => true}
  validates :password,
    :length => {:in => (4..20)},
    :format => {:with => /\A[a-zA-Z0-9]+\z/}
  validates :nickname,
    :length => {:in =>(4..20)},
    :format => {:with => /\A[a-zA-Z0-9]+\z/}
  
  validates :nickname,:uniqueness => {:case_sensitive => true}, on: :registration
  validates :mail,:length => {:in => (5..100)},:format => {:with =>VALID_EMAIL_REGEX}, on: :registration

  def self.regist(user)
    if user.valid?(:registration)
      user.password = hide_password(user.password)
      user.device=0
      return user.save(:validate => false)
    end
    false
  end
  
  def self.updateuser(user)
    temp=user.password
    user.password="TEMP"
    if user.valid?(:registration)
      user.password=temp
      return user.save(:validate => false)
    end
  end
  
  
  def self.hide_password(pwd)
    Digest::MD5.hexdigest(pwd).to_s
  end
  
  def self.login(user)
    if auth(user)
      finduser=User.find_by_nickname(user.nickname)
      user.id=finduser.id
    else
      user.errors.add(:nickname,I18n.t("users.auth_failure"));
      false
    end
  end
  
  def self.auth(user)
    User.where(:nickname => user.nickname, :password => hide_password(user.password)).exists?
  end
end
