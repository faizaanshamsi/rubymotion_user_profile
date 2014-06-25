class User
  ATTRIBUTES = [
    :id,
    :email,
    :name
  ]

  ATTRIBUTES.each do |attr|
    attr_accessor attr
  end
end
