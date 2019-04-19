require_relative('../db/sqlrunner.rb')
require_relative('film.rb')
require_relative('customer.rb')


class Tickets


def initialize(options)
  @id = options['id']to_i if options['id']
  @customer_id = options['customer_id'].to_i
  @film_id = options['film_id'].to_i
end




end
