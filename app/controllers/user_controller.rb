class UserController < UIViewController
  attr_accessor :user
  
  def initWithUser(user)
    initWithNibName(nil, bundle: nil)
    self.user = user
    self
  end

  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor

    last_label = nil
    User::ATTRIBUTES.each do |prop|
      label = UILabel.alloc.initWithFrame(CGRectZero)
      label.text = prop.to_s.capitalize

      label.sizeToFit
      if last_label
        label.frame = [
          [last_label.frame.origin.x, last_label.frame.origin.y + last_label.frame.size.height],
          label.frame.size
        ]
      else
        label.frame = [
          [10,20],
          label.frame.size
        ]
      end
      last_label = label

      self.view.addSubview(label)

      value = UILabel.alloc.initWithFrame(CGRectZero)
      value.text = self.user.send(prop)
      value.sizeToFit
      value.frame = [
        [label.frame.origin.x + label.frame.size.width + 10, label.frame.origin.y],
        value.frame.size
      ]

      self.view.addSubview(value)
    end

    self.title = self.user.name
  end
end
