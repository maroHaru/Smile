class Timecard < ApplicationRecord
  belongs_to :daily_report
  belongs_to :worker
  belongs_to :client
  belongs_to :job
  belongs_to :to_do

end
