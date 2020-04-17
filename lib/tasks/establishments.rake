namespace :establishments do
  desc "Load data from basic health units in Brazil"
  task :load => :environment do
    Rails.logger.info "[rake establishments:load] Starting!"

    Rails.logger.info "[rake establishments:load] Downloading in CSV..."
    datafile = UbsFile.download

    Rails.logger.info "[rake establishments:load] Transforming to data object..."
    data = datafile.transform!

    Rails.logger.info "[rake establishments:load] Loading data in database..."
    data.each do |row|
      row = row.to_hash

      Establishment.update_or_create(
        { cnes_id: row[:co_cnes] },
        {
          cnes_id:      row[:co_cnes],
          latitude:     row[:lat],
          longitude:    row[:long],
          name:         row[:no_fantasia],
          address:      row[:no_logradouro],
          number:       row[:nu_endereco],
          neighborhood: row[:no_bairro],
          city:         row[:cidade],
          uf:           row[:uf],
          phone:        row[:nu_telefone]
        }
      )
    end

    Rails.logger.info "[rake establishments:load] Successfully concluded!"
  end
end
