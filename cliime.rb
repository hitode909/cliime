require 'rubygems'
require 'bundler'
require 'json'
require 'net/http'

Bundler.require

class CLIIME

  def translate(romaji)
    hiragana = romaji.to_hiragana
    uri = URI.parse 'http://www.google.com/transliterate'
    http = Net::HTTP.new(uri.host, uri.port)
    begin
      http.start do |h|
        res = h.get("/transliterate?langpair=ja-Hira%7Cja&text=" + URI.escape(hiragana))
        obj = JSON.parse(res.body.to_s)
        puts expand(obj).join("\n")
      end
    rescue => e
      warn e
      return []
    end
  end

  def expand(list)
    kouho = []
    current = list.shift

    result = current[1]
    if list.length > 0
      rest = expand(list)
      rest[0..3].each{|s|
        result[0..3].each{|r|
          kouho.push r+s
        }
      }
    else
      result[0..3].each{|r|
        kouho.push r
      }
    end

    kouho
  end
end


ime = CLIIME.new

text = ARGV.first

unless text
  warn "text required"
  exit 1
end

ime.translate(text)
