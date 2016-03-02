class Event < ActiveRecord::Base
  # attr_accessible :starts_at, :ends_at, :all_day, :performer_id, :todolist_id, :color

  belongs_to :todolist
  belongs_to :user
  validates :starts_at, :presence => true
  validates :ends_at, :presence => true
  # scope :my_jobs,  where(private: true)

  def self.add_event params
    Event.create(starts_at: params[:starts_at], ends_at: params[:ends_at],
                 all_day: params[:all_day], todolist_id: params[:todolist_id], color: params[:color])
  end

  scope :between, lambda {|start_time, end_time|
                  {:conditions => ["? < starts_at < ?", Event.format_date(start_time), Event.format_date(end_time)] }
                }

  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {

        :color => self.color,
        :title => Todolist.find(self.todolist_id).title,
        :start => starts_at,
        :end => ends_at,
        :allDay => self.all_day,
        # :recurring => false,
        :url => Rails.application.routes.url_helpers.event_path(id)
    }

  end

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

end
