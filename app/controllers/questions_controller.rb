class QuestionsController < ApplicationController
  def index
    dogs = Animal.where(kind: "Cachorro")
    @dogs_monthly_cost_average = dogs.pluck(:monthly_cost).instance_eval { reduce(:+) / size.to_f }
    @dogs_size = dogs.size
    @dogs_names = dogs.pluck(:name)
    curators = Curator.joins(:animals).select('curators.*, sum(animals.monthly_cost) as total_cost, sum(animals.monthly_cost) * 3 as future_cost').group("curators.id").reorder("total_cost desc")
    @reordened_curators = curators
    @three_months_costs = curators.map { |curator| {"#{curator.name}": curator.future_cost } }
  end
end
