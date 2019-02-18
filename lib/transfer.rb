require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if @status == 'complete'
      return
    end
    if sender.balance > @amount
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
    receiver.deposit(amount)
    sender.deposit(amount * -1)
    @status = 'complete'
  end
end
