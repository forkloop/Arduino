require 'dino'
require 'gmail'


def blink
  board = Dino::Board.new(Dino::TxRx.new)
  led = Dino::Components::Led.new(pin: 13, board: board)
  
  1.upto 10 do
    led.send :on
    sleep 1
    led.send :off
    sleep 1
  end
end

Gmail.new('forkloop', '') do |gmail|
  if ((unread = gmail.inbox.count(:unread)) > 0)
    puts "unread mails: #{unread}"
    blink
  end
end

