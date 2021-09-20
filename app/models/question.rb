class Question < ApplicationRecord
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  scope :_search_, ->(params_term){
    includes(:answers)
    .where("lower(description) like ?", "%#{params_term.downcase}%")
  }
    
  scope :_search_subject_, ->(subject_id){
    includes(:answers, :subject)
    .where(subject_id: subject_id)
  }
    

 scope :search_pagination, ->(params_term, params_page, quantity){
	self._search_(params_term).page(params_page).per(quantity)
 }
   

end
