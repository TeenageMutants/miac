class Todolist < ActiveRecord::Base
  # attr_accessible :description, :title, :user_id, :performer_id, :private, :event_attributes
  belongs_to :user
  has_one :event, dependent: :destroy
  accepts_nested_attributes_for :event
  # scope :my_jobs,  where(private: true)
  validates :title, presence: true
  validates :performer_id, presence: true

  def self.add_todolist params
    Todolist.create(title: params[:title], description: params[:description],
                    user_id: params[:user_id], performer_id: params[:performer_id],
                    private: params[:private])
  end





end

