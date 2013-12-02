# encoding: UTF-8
class Prompt
  attr :shell

  def read_credit_cards
    # This is a lambda that runs the content of the block
    # after the input is typed.
    @shell = -> prompt do
      print "[*] #{prompt}"
      read_input(gets)
    end

    read_loop
  end

  private
  def read_input(input)
    input = input.strip.to_s.downcase
    case input
      when 'x', 'exit'
        exit
      else
        cc = CreditCard.new(input)
        is_valid = Validator.new(cc).validate!
        output_cc(cc, is_valid)
    end
  end

  def read_loop
    # this loops after every input and exits with
    # X or EXIT.
    loop do
      @shell["> "]
    end
  end

  def output_cc(cc, is_valid)
    puts "[+] #{cc.type}: #{cc.number} (#{is_valid ? 'valid' : 'invalid'})"
  end
end
