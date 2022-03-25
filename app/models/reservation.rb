class Reservation < ApplicationRecord
  belongs_to :room
  validates :start_at, {presence: true}
  validates :end_at, {presence: true}
  def start_end_check
    errors.add(:end_at, "は今日以降の日付で選択してください。") unless
    :start_at > :end_at 
  end
end
