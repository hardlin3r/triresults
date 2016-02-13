class Racer
  include Mongoid::Document
  before_create do |racer|
    racer.info.id = racer.id
  end
  embeds_one :info , as: :parent, class_name: 'RacerInfo', autobuild: true
end
