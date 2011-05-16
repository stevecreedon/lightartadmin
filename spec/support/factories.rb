Factory.define :payment_method do |payment_method|
  payment_method.name 'test payment type'
end

Factory.define :cost_centre do |cost_centre|
  cost_centre.name 'test cost centre'
end

Factory.define :cost_type do |cost_type|
  cost_type.name 'test cost type'
end

Factory.define :contact do |contact|
  contact.name 'test contact'
end

Factory.define :company do |company|
  company.name 'test company'
end

Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.define :user do |user|
  user.email {Factory.next(:email)}
  user.password 'Fyodor01'
end

Factory.define :project do |project|
  project.name 'test project'
end

Factory.define :cost do |cost|
  cost.description 'test cost description'
  cost.amount BigDecimal.new('101.01')
  cost.reference 'ref:test/123'
  cost.payment_date Date.civil(2010,6,6)
  cost.payment_method {Factory(:payment_method)}
  cost.cost_type {Factory(:cost_type)}
  cost.project {Factory(:project)}
  cost.cost_centre {Factory(:cost_centre)}
  cost.contact {Factory(:contact)}
  cost.company {Factory(:company)}
  cost.user {Factory(:user)}
  cost.vat 17.5
  cost.vat_inclusive true
end