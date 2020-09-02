module V2
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name

    belongs_to :kind do
      link(:related) {v2_contact_kind_url(object.id)}
    end

    has_many :phones do
      link(:related) {v2_contact_phones_url(object.id)}
    end

    has_one :address do
      link(:related) {v2_contact_address_url(object.id)}
    end

    # link(:self){
    #   contact_path(object.id)
    # }

    # link(:self){
    #   contact_url(object.id)
    # }

    # link(:kind){
    #   kind_url(object.kind.id)
    # }

    # def author
    #   "Amedes Júnior"
    # end

    meta do
      {author: "Amedes Júnior"}
    end


    # def attributes(*args)
    #   h = super(*args)
    #   # h[:bithdate] = I18n.l(object.bithdate) unless object.bithdate.blank? --> pt-BR
    #   h[:bithdate] = object.bithdate.to_time.iso8601 unless object.bithdate.blank?
    #   h
    # end

  end
end
