Rails.application.routes.draw do

  get 'tweet_students/index'
  get 'tweet_teachers/index'

  devise_for :teachers, controllers: {
    sessions: 'teachers/sessions',
    passwords: 'teachers/passwords',
    registrations: 'teachers/registrations'
  }
  

  devise_for :students, controllers: {
    sessions: 'students/sessions',
    passwords: 'students/passwords',
    registrations: 'students/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tweet_students do
    resources :likes, only: [:create, :destroy]
  end

  resources :tweet_teachers

  resources :students do
    resources :relations, only: [:create, :destroy]
  end

  resources :teachers
  resources :finals
  resources :middles
  resources :subjects
  resources :todos
  resources :schedules

  resources :conversations do
    resources :messages
  end
  
  patch 'tweet_students/:id/all_destroy' => 'tweet_students#all_destroy', as:'all_destroy_tweet_students'
  get 'students/:id/callender' => 'students#callender' , as: 'student_callender'
  get 'hello/index' => 'hello#index'
  root 'hello#index'
  get 'hello/link' => 'hello#link'
  
  get 'tweet_students/:id/history' => 'tweet_students#history_index', as:'history_index_tweet_students'
  get 'tweet_students/:id/history/:id' => 'tweet_students#history_show', as:'history_show_tweet_student'
  patch 'tweet_students/:id/history/:id' => 'tweet_students#physical_destroy', as:'physical_destroy_tweet_students'

  patch 'tweet_teachers/:id/all_destroy' => 'tweet_teachers#all_destroy', as:'all_destroy_tweet_teachers'
  get 'tweet_teachers/:id/history' => 'tweet_teachers#history_index', as:'history_index_tweet_teachers'
  get 'tweet_teachers/:id/history/:id' => 'tweet_teachers#history_show', as:'history_show_tweet_teacher'
  patch 'tweet_teachers/:id/history/:id' => 'tweet_teachers#physical_destroy', as:'physical_destroy_tweet_teachers'




end
