Rails.application.routes.draw do
  root 'lab#input'
  get 'lab/input'
  get 'lab/show'
  get 'lab/check_xml'
end
