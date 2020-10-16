class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :burde, :area, :day


  has_one_attached :image
  belongs_to :user

  validates :name, :description, :category_id, :status_id, 
            :burde_id, :area_id, :day_id, :price, presence: true     
            
  validates :category_id, :status_id, :burde_id, :area_id, :day_id, numericality: { other_than: 1 } 
end
