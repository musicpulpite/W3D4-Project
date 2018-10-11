# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord

  has_many :answer_choices,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'

  belongs_to :poll,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def slow_results
    hash = {}
    self.answer_choices.each {|t| hash[t.text] = t.responses.count}
    hash
  end

  def fast_results
    hash = {}
    self.answer_choices.includes.each {|t| hash[t.text] = t.responses.length}
    hash
  end

  def fastest_results

    query = "
    SELECT answer_choices.text, COUNT(responses.user_id) as total
    FROM answer_choices
    LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id
    WHERE answer_choices.question_id = #{self.id}
    GROUP BY answer_choices.id
    "

    Question.find_by_sql(query).pluck(:text, :total).to_h
    end
end
