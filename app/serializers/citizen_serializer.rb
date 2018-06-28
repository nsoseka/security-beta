class CitizenSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date_of_birth, :expiry_date, :id_card_number, :date_issued
  
  attribute :restrictions do |citizen|
    citizen.restrictions.reject do |restriction|
      restriction.remove
    end
  end

  attribute :name do |citizen|
    "#{citizen.surname} #{citizen.given_names}"
  end

  attribute :flags do |citizen|
    citizen.flags.reject do |flag|
      flag.remove 
    end
  end

  attribute :id_status do |citizen|
    citizen.expiry_date < Date.today() ? 'Expired' : 'Valid!'
  end

  attribute :avatar do |citizen|
    citizen.avatar.variant(resize: '100x100')
  end
end
