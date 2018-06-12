# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Citizen.create({surname: 'Lukong', given_names: 'Isaac Nsoseka', date_of_birth: '31/08/1993', 
#                 father: 'Lukong Isaac', mother: 'Wirnkar Lukong Alice', occupation: 'Student',
#                 address: 'Bambui', height: 1.85, sex: 'M', sp: 1583, id_card_number: 117080894,
#                 date_issued: '10/09/2015', expiry_date: '10/09/2025', passport_url: '/public/sample.jpeg'})

# citizen = Citizen.first

# station = Station.create({name: 'Kumbo Police Station Tobin', location: 'Tobin, Kumbo, Bui Divison',
#                           region: region, kind: 'Police Station'})
# agent = Agent.create({name: 'Lukong the Agent', role: 'police', station: station,
#                       id_card_number: 117080894, service_id: '123XQW' })

# convocation = Convocation.create({citizen: citizen, agent: Agent.first, reason: 'Suspected of stealing meat',
#                                   date_expected: '12/01/2019', status: false, honor_status: false,
#                                   convoker_id: citizen.id, station: Station.first })


region = Region.create({name: 'North West Region', code: 'NWR01'})

station = Station.create({name: 'Kumbo Police Station Tobin', location: 'Tobin, Kumbo, Bui Divison',
                          region: region, kind: 'Police Station'})
station = Station.create({name: 'Nkambe Police Station', location: 'Nkambe',
                          region: region, kind: 'Police Station'})
station = Station.create({name: 'Jakiri Gendarmerie', location: 'Jakiri',
                          region: region, kind: 'Gendarmerie'})
station = Station.create({name: 'Bamenda Supreme Court', location: 'Bamenda, lyonga Street',
                         region: region, kind: 'Court'})
station = Station.create({name: 'Ndu Police Station', location: 'Ndu',
                          region: region, kind: 'Police Station'})
station = Station.create({name: 'Ndop Police Station', location: 'Ndop',
                          region: region, kind: 'Police Station'})
