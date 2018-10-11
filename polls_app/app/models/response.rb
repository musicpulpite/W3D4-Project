# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  answer_choice_id :integer          not null
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  # validate :respondent_already_answered?
  # validate :author_answering_own_poll?

  belongs_to :answer_choice,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  belongs_to :respondent,
    foreign_key: :user_id,
    class_name: 'User'

  def sibling_responses
    self.question.responses.where.not('responses.id = ?', self.id)
  end

  def respondent_already_answered?
    self.sibling_responses.exists?(:user_id => self.user_id)
  end

  def author_answering_own_poll?
    self.poll.user_id == self.user_id
  end

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll


end
