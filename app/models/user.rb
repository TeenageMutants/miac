# coding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :roles
  belongs_to :role


  def self.local_ip
    orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true  # turn off reverse DNS resolution temporarily

    UDPSocket.open do |s|
      s.connect '93.158.134.3', 1
      s.addr.last
    end
  ensure
    Socket.do_not_reverse_lookup = orig
  end

  def role?(role)
    self.role && self.role.name == role.to_s.camelize
  end

  def self.change_fio params, current_user
    current_user.update_attributes(fio: params[:fio])
  end

  def self.change_password params, current_user
    current_user.update_attributes(password: params[:new_password], sign_in_count: User.find(current_user.id).sign_in_count+1) if User.find(current_user.id).password.present?
  end

  def self.blocked_user params
    User.find(params[:id]).update_attributes(blocks: true) if User.find(params[:id]).present?
    Block.create(user_id:params[:id], reason:"no reason", blocked_at:Time.now) if Block.where(user_id: params[:id],reason:"no reason", blocked_at: Time.now).present?
  end

  def self.unblocked_user params
    User.find(params[:id]).update_attributes(blocks: false) if User.find(params[:id]).present?
    Block.where(user_id: params[:id], unblocked_at: nil).first.update_attributes(unblocked_at:Time.now) if Block.where(user_id: params[:id], unblocked_at: nil).first.present?
  end

  def self.add_user params
    new_user = User.create(email: params[:email], username: params[:username], password:"123456aA", fio:params[:fio], role_id:params[:role_id],  sign_in_count:0)
    InfoDesk.create(user_id:new_user.id, contact_tel:'123456', contact_email: params[:email], position:'test', organization_id: params[:org_id], department_id: 123)
    new_user.roles << Role.find(params[:role_id].to_i)
  end

  def self.set_role params
    user = User.find(params[:id])
    #User.find(params[:id])

    user.update_attributes(role_id: params[:role]) if User.find(params[:id]).present?
    # Role.find(User.find(params[:id]).role_id).update_attributes(role_id:params[:role]) if User.find(params[:id]).present?
    # User.find(params[:id]).roles.update_attributes(Role.find(role_id:params[:role]))
    # User.find(params[:id]).roles << Role.find(params[:role])
    if user
      user.update_attributes(role_id: params[:role])
    end
  end
end