class Todolist < ActiveRecord::Base
  # attr_accessible :description, :title, :user_id, :performer_id, :private, :event_attributes
  belongs_to :user
  has_one :event, dependent: :destroy
  accepts_nested_attributes_for :event
  # scope :my_jobs,  where(private: true)


  def self.add_todolist params
    Todolist.create(title: params[:title], description: params[:description],
                    user_id: params[:user_id], performer_id: params[:performer_id],
                    private: params[:private])
  end

  validates :title, presence: true
  validates :performer_id, presence: true

  def self.fill_ancestry_for_user current_user
    array_child = []
    array_parent = []
    @my_hash = {}

    key_id = User.find(current_user).id
    name_id = User.find(current_user).username
    # puts key_id
    array_child = User.find(key_id).sibling_ids  + User.find(key_id).descendant_ids
    array_child

    array_parent = User.find(key_id).ancestor_ids
    puts array_parent
    @my_hash = {:parent => array_parent,:child => array_child}
    return @my_hash





    # n = 0
    # hash[:child].each do
    #
    #   id = hash[:child][n]
    #   user = User.find(hash[:child][n]).username
    #
    #   hash[:child][n] = [ user, id ]
    #
    #   n += 1
    #
    # end
    # puts hash[:child]
    #
    # n = 0
    # hash[:parent].each do
    #
    #   id = hash[:parent][n]
    #   user = User.find(hash[:parent][n]).username
    #
    #   hash[:parent][n] = [ user, id ]
    #
    #   n += 1
    #
    # end
    # puts hash[:parent]




    # puts hash
    # puts @array_parent
    # hash = { :parent => @array_parent, :child => array_child}
    # puts hash
    # key_id = User.find(current_user).id
    # puts key_id

    # hash_child[user.id] = { :parent => @array_parent[user.id],
    #                   :child => array_child[user.id]}
    #
    # hash[user.id][:child].shift


    # puts "хэш #{hash}"

    # key_id = User.find(current_user).id
    # @array_parent = hash[key_id][:parent]
    # array_child = hash[key_id][:child]
    # hash_for_user = hash[key_id]
    # puts hash_for_user
    # return hash_for_user

    # puts "@array_parent #{@array_parent}"
    # puts "array_child #{array_child}"
    #
    # n = 0
    # child = []
    # parent = []
    # if array_child.present?
    #   array_child.each do |i|
    #     child[n] = (User.find(i)).username
    #     n += 1
    #   end
    # end
    #
    # if @array_parent.present?
    #   @array_parent.each do |i|
    #     parent[n] = (User.find(i)).username
    #     n += 1
    #   end
    # end
    # parent.compact!
    # child.compact!
    # puts parent
    # puts child
    #
    # hash_for_user = { :parent => parent, :child => child }
    # puts hash_for_user
    # return hash_for_user

    #
    # # puts "Подчиненные для #{(User.find(user)).username}: #{child}"
    # # puts "Начальники для #{(User.find(user)).username}: #{parent}"

  end

end

