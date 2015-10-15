class Root < Grape::API
  mount V1::Root
  # mount V2::Root (next version)
end
