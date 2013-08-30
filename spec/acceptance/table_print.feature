Feature: Object#tpp
  Scenario: Call tpp within methods chain
    Given I have the following code:
    """
    class Message
      attr_accessor :from, :message
    end
    [].tap do |o|
      o << Message.new.tap{|n| n.from = 'Bob' ; n.message = 'Hello.'}
      o << Message.new.tap{|n| n.from = 'Alice' ; n.message = 'Good night.'}
    end.tpp.tpp(message_size: lambda{|n| n.message.size})
    """

    When Ruby it
    Then I should see:
    """
    FROM  | MESSAGE    
    -------------------
    Bob   | Hello.     
    Alice | Good night.

    MESSAGE_SIZE
    ------------
    6           
    11          

    """