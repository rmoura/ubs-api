# frozen_string_literal: true

namespace :haversine do
  desc 'Comparative Ruby vs PGSQL: Use of the Haversine Formula'
  task benchmarking: :environment do
    Rails.logger.info '[rake haversine:benchmarking] Starting'

    Rails.logger.info 'Comparative: Use of the Haversine Formula'
    Benchmark.bm do |experiment|
      Rails.logger.info '[rake haversine:benchmarking] Function PSQL...'
      experiment.report('Function PGSQL:') do
        Establishment.order(
          'haversine(%f, %f, latitude, longitude)' % [ -23.604936, -46.692999 ]
        ).paginate
      end

      Rails.logger.info '[rake haversine:benchmarking] Ruby code...'
      experiment.report('Ruby code:') do
        relation = Establishment.all.sort_by do |estab|
          Haversine.distance(-23.604936, -46.692999, estab.latitude, estab.longitude)
        end

        Kaminari.paginate_array(relation)
      end
    end

    Rails.logger.info '[rake haversine:benchmarking] Successfully concluded!'
  end
end
