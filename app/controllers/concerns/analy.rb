require 'java_iterator.rb'

Rjb.load(Rails.root.join('lib', 'kuromoji-0.7.7.jar'))
Tokenizer = Rjb.import('org.atilika.kuromoji.Tokenizer')
module Analy
  include JavaIterator
  @tokenizer = Tokenizer.builder.userDictionary(Rails.root.join('config', 'dictionaries', 'kit.txt').to_s).build
  def self.tokenize(sentence)
    sentence = '' if sentence.nil?
    words = []
    list = @tokenizer.tokenize(sentence)
    list.extend JavaIterator
    list.each do |x|
      next unless x.isUser
      words.push(x.surface_form)
    end
    words.uniq
  end
end
