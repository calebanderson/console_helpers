module ConsoleHelpers
  # Allows passing mildly sensitive information via private channels without having to include explicit instructions
  # on how to decrypt. Workplace specific because the instructions are "You know how we get X? Do that with this"
  module StupidEncrypt
    def stupid_encrypt(string)
      encrypted = _stupid_encrypt(string)
      decrypted = stupid_decrypt(encrypted)
      if decrypted == string
        encrypted
      else
        puts "Couldn't reverse the encryption: got #{decrypted.dump}"
      end
    end

    def _stupid_encrypt(string)
      string.chars.map { |c| c.ord - 1 }.map(&:chr).join
    end

    def stupid_decrypt(string)
      string.chars.map(&:next).join
    end
  end

  include StupidEncrypt
end

