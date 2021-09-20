class UserProfile < ApplicationRecord
  #Model criado para fazer associação com a tabela User do Devise, adicionando novos dados.
  #Este model não tem relação com o controller UserProfiler.
  belongs_to :user
end
