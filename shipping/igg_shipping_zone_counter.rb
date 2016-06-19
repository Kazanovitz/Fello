require 'csv'
require 'pry'

module Shipping
  class Zone

    def initialize
      @zones = zone_db
      @zones_total = {'1'=> 0, '2'=> 0, '3'=> 0, '4'=> 0, '5'=> 0, '6'=> 0, '7'=> 0, '8'=> 0, '9'=> 0 }
    end

    def import_igg
      puts 'starting import'
     file = 'IGG Backers - all.csv'
      CSV.open('zones.csv','w') do |csv|
        igg_data = CSV.foreach(file, headers: true).map(&:to_hash)
        #insert headers
        csv << igg_data.first.keys
        igg_data.each do |backer|
          if  is_us?(backer) && !backer['Shipping Zip/Postal Code'].nil?
            zip = backer['Shipping Zip/Postal Code'][0..2]
            zone = @zones[zip]
            backer['Shipping Zone'] = zone
            puts backer if zone.nil?
            @zones_total[zone] += 1
          end
          csv << backer.values
        end
        puts @zones_total
      end
    end

    def is_us?(backer)
     backer['Shipping Country'] == 'United States'
    end


    def zone_db
      puts 'db creation begin'
      h = {}
      # we need to prepend these with 00
      (5..9).each { |n| key = "00#{n}"; h[key] = '8' }
      (10..98).each { |n| key = "0#{n}"; h[key] = '8' }
      (515..516).each { |n| h[n.to_s] = '6' }
      (716..729).each { |n| h[n.to_s] = '7' }
      (894..895).each { |n| h[n.to_s] = '4' }
      (100..212).each { |n| h[n.to_s] = '8' }
      (520..528).each { |n| h[n.to_s] = '7' }
      (730..731).each { |n| h[n.to_s] = '6' }
      h[897.to_s] = '4'
      (214..268).each { |n| h[n.to_s] = '8' }
      (530..532).each { |n| h[n.to_s] = '8' }
      (733..741).each { |n| h[n.to_s] = '6' }
      h[898.to_s] = '5'
      (270..342).each { |n| h[n.to_s] = '8' }
      h[534.to_s] = '8'
      (743..754).each { |n| h[n.to_s] = '6' }
      (900..908).each { |n| h[n.to_s] = '2' }
      h[344.to_s] = '8'
      h[535.to_s] = '7'
      (755..756).each { |n| h[n.to_s] = '7' }
      (910..918).each { |n| h[n.to_s] = '2' }
      (346..347).each { |n| h[n.to_s] = '8' }
      (537..548).each { |n| h[n.to_s] = '7' }
      (757..758).each { |n| h[n.to_s] = '6' }
      (919..921).each { |n| h[n.to_s] = '3' }
      (349..352).each { |n| h[n.to_s] = '8' }
      h[549.to_s] = '8'
      h[759.to_s] = '7'
      (922..928).each { |n| h[n.to_s] = '2' }
      (354..368).each { |n| h[n.to_s] = '8' }
      (550..551).each { |n| h[n.to_s] = '7' }
      (760..769).each { |n| h[n.to_s] = '6' }
      (930..931).each { |n| h[n.to_s] = '1' }
      h[369.to_s] = '7'
      (553..567).each { |n| h[n.to_s] = '7' }
      h[770.to_s] = '7'
      (932..933).each { |n| h[n.to_s] = '2' }
      (370..374).each { |n| h[n.to_s] = '8' }
      (570..577).each { |n| h[n.to_s] = '6' }
      (772..778).each { |n| h[n.to_s] = '7' }
      h[934.to_s] = '1'
      h[375.to_s] = '7'
      (580..584).each { |n| h[n.to_s] = '7' }
      (779..797).each { |n| h[n.to_s] = '6' }
      h[935.to_s] = '2'
      (376..379).each { |n| h[n.to_s] = '8' }
      (585..588).each { |n| h[n.to_s] = '6' }
      (798..816).each { |n| h[n.to_s] = '5' }
      (936..941).each { |n| h[n.to_s] = '3' }
      (380..383).each { |n| h[n.to_s] = '7' }
      (590..593).each { |n| h[n.to_s] = '5' }
      (820..838).each { |n| h[n.to_s] = '5' }
      h[942.to_s] = '4'
      (384..385).each { |n| h[n.to_s] = '8' }
      (594..596).each { |n| h[n.to_s] = '6' }
      (840..847).each { |n| h[n.to_s] = '5' }
      (943..951).each { |n| h[n.to_s] = '3' }
      (386..397).each { |n| h[n.to_s] = '7' }
      (597..599).each { |n| h[n.to_s] = '5' }
      (850..853).each { |n| h[n.to_s] = '4' }
      (952..953).each { |n| h[n.to_s] = '4' }
      (398..418).each { |n| h[n.to_s] = '8' }
      (600..620).each { |n| h[n.to_s] = '7' }
      (855..857).each { |n| h[n.to_s] = '4' }
      h[954.to_s] = '3'
      h[420.to_s] = '7'
      (622..631).each { |n| h[n.to_s] = '7' }
      (859..860).each { |n| h[n.to_s] = '4' }
      (955..961).each { |n| h[n.to_s] = '4' }
      (421..422).each { |n| h[n.to_s] = '8' }
      (633..641).each { |n| h[n.to_s] = '7' }
      h[863.to_s] = '4'
      (962..966).each { |n| h[n.to_s] = '3' }
      (423..424).each { |n| h[n.to_s] = '7' }
      (644..658).each { |n| h[n.to_s] = '7' }
      h[864.to_s] = '3'
      (967..968).each { |n| h[n.to_s] = '8' }
      (425..427).each { |n| h[n.to_s] = '8' }
      (660..662).each { |n| h[n.to_s] = '7' }
      h[865.to_s] = '5'
      h[969.to_s] = '9'
      (430..474).each { |n| h[n.to_s] = '8' }
      (664..668).each { |n| h[n.to_s] = '7' }
      (870..871).each { |n| h[n.to_s] = '5' }
      (970..974).each { |n| h[n.to_s] = '5' }
      (475..477).each { |n| h[n.to_s] = '7' }
      (669..681).each { |n| h[n.to_s] = '6' }
      (873..880).each { |n| h[n.to_s] = '5' }
      (975..976).each { |n| h[n.to_s] = '4' }
      (478..499).each { |n| h[n.to_s] = '8' }
      (683..693).each { |n| h[n.to_s] = '6' }
      (881..882).each { |n| h[n.to_s] = '6' }
      (977..986).each { |n| h[n.to_s] = '5' }
      (500..509).each { |n| h[n.to_s] = '7' }
      (700..701).each { |n| h[n.to_s] = '7' }
      (883..885).each { |n| h[n.to_s] = '5' }
      (988..994).each { |n| h[n.to_s] = '5' }
      (510..513).each { |n| h[n.to_s] = '6' }
      (703..708).each { |n| h[n.to_s] = '7' }
      (889..891).each { |n| h[n.to_s] = '3' }
      (995..997).each { |n| h[n.to_s] = '8' }
      h[514.to_s] = '7'
      (710..714).each { |n| h[n.to_s] = '7' }
      h[893.to_s] = '3'
      (998..999).each { |n| h[n.to_s] = '7' }
      puts 'db creation Finished'
      h
    end
  end
end


Shipping::Zone.new().import_igg
