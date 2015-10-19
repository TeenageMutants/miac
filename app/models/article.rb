# coding: utf-8
class Article < ActiveRecord::Base
	# attr_accessible :title, :preview, :body, :published_at, :published_to, :user_id, :types, :vid_url, :image
	has_attached_file :image, :styles => { :hd => "1080x720>", :xlarge => "1920x700>", :news =>"973x615#", :large => "750x300>", :medium => "300x300>",  :small => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/rails.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	scope :types_0, -> { where(types: 0)}
	scope :types_1, -> { where(types: 1)}
	scope :types_2, -> { where(types: 2)}
	scope :types_3, -> { where(types: 3)}
	scope :types_4, -> { where(types: 4)}
	scope :types_5, -> { where(types: 5)}
	scope :publics_to, -> { where("published_to > ?",Date.today)}
	scope :publics, -> {where('published_at <= ? and published_to > ? ', Date.today, Date.today)}
	scope :publics_at,  -> { where("published_at between ? and ?",Date.today.beginning_of_day, Date.today.end_of_day)}
	belongs_to :user
	has_many :foto



	TAGS = {123 => {name: "Тег (Выберите...)"}, 0 => {name: "Здравоохранение", color: "rgba-default"}, 1 => {name: "Информатизация", color: "rgba-blue"}, 2 => {name: "Проекты", color: "rgba-yellow"}, 3 => {name: "Деятельность МИАЦ'a", color: "rgba-purple"}}

	def self.add_article params,current_user
		Article.create(title:params[:title], types:params[:types], preview:params[:preview], body: params[:body], vid_url: (params[:vid_url] if params[:vid_url].present?), published_at: Time.now, published_to: Time.now, user_id: current_user.id)
	end

	def self.edit_article params
		Article.find(params[:id]) if Article.find(params[:id]).present?

	end
	def self.remove_article params
		Article.find(params[:id]).delete if Article.find(params[:id]).present?
	end

	def self.update_article params
		if Article.find(params[:id]).present?
			Article.find(params[:id]).update_attributes(title: params[:title],preview:params[:preview],body: params[:body])
		end
	end

	def self.aaaa params
		if params[:search].present?
			key = "%#{params[:search]}%"
			Article.where('body LIKE :search OR preview LIKE :search OR title LIKE :search', search: key).order(:title)
		else
			Article.all
		end
	end
end
