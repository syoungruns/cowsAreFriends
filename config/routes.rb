Rails.application.routes.draw do
  get 'startup/index2'

  get 'cows/index2'

  get 'resultAll' => 'cows#resultAll'

  post 'result' => 'cows#cowResult'

  get 'result' => 'cows#result'

  post 'tiebreaker' => 'cows#tiebreaker'

  post 'tiebreaker/:cow_one/:cow_two' => 'cows#tiebreaker'

  get 'cows/show'

  get 'index2' => 'cows#index2'

  root 'cows#index2'
end
