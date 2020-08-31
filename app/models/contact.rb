class Contact < ApplicationRecord

  belongs_to :kind, optional: true
  has_many :phones
  has_one :address


  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def bithdate_br
    I18n.l(self.bithdate) unless self.bithdate.blank?
  end


  # def author
  #   "Amedes Júnior"
  # end

  # def kind_description
  #   self.kind.description
  # end

  def as_json(options={})
    super(
        # methods: [:author, :kind_description],
        # root: true,
        # include: { kind: {only: [:id, :description]} },
        methods: [:bithdate_br],
        include: [  :kind,
                    { phones:  {except: [:contact_id]}},
                    { address: {except: [:contact_id]}}
                 ]
    )
  end



end
