# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  has_many :authored_polls,
    foreign_key: :user_id,
    class_name: 'Poll'

  has_many :questions,
    through: :authored_polls,
    source: :questions

  has_many :answer_choices,
    through: :questions,
    source: :answer_choices

  has_many :responses,
    through: :answer_choices,
    source: :responses


end
