class Contact < ApplicationRecord
	belongs_to :kind, optional: true
	has_many :phones
	has_one :address


	accepts_nested_attributes_for :phones, allow_destroy: true
	accepts_nested_attributes_for :address, update_only: true
	# def author
	# 	"Benjamín Silva"
	# end

	# def kind_description
	# 	self.kind.description
	# end

	# def as_json(options = {})
	# 	super(
	# 		root: true,
	# 		methods: [:author, :kind_description]
	# 		)
	# end

	# def hello
	# 	I18n.t('hello')
	# end

	# def i18n
	# 	I18n.default_locale
	# end

	# def to_es
	# 	{
	# 		name: self.name,
	# 		email: self.email,
	# 		birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
	# 	}
	# end

	def as_json(options={})
		h = super(options)
		h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
		h
	end
end
