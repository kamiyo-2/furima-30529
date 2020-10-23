class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burde
  belongs_to_active_hash :area
  belongs_to_active_hash :day



  has_one_attached :image
  belongs_to :user
  has_one  :order

  validates :name, :description, :category_id, :status_id, 
            :burde_id, :area_id, :day_id, :price, :image, presence: true     
            
  validates :category_id, :status_id, :burde_id, :area_id, :day_id, numericality: { other_than: 0 } 

  validates :price,
    numericality: { only_integer: true,
    greater_than: 300, less_than: 9999999
  }
end


