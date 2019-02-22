
class Transfer
  attr_accessor :sender, :status
  attr_reader :receiver, :amount

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid?
  if self.sender.valid? == true && self.receiver.valid? == true
    true
  else
    false
  end
end

# def execute_transaction
#   unless self.status != "complete"
#   self.sender.balance -= @amount
#   self.receiver.balance += @amount
#   self.status = "complete"
# else
#   self.status = "rejected"
#   "Transaction rejected. Please check your account balance."
#   end

def execute_transaction
  # puts "IS IT OKAY???" + self.sender.valid?
  # puts "IS IT OKAY???" + self.status != "complete"
  #binding.pry

  if self.status != "complete" && self.sender.valid? && self.sender.balance >= self.amount
     self.sender.balance -= @amount
     self.receiver.balance += @amount
     self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if self.status == "complete"
     self.sender.balance += @amount
     self.receiver.balance -= @amount
     self.status = "reversed"
  end
  end



end
