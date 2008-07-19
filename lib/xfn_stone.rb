basedir = File.dirname(__FILE__)
$:.unshift basedir

require 'uri'
require 'open-uri'

require 'xfn_stone/document.rb'
require 'xfn_stone/person.rb'

module XfnStone
  VERSION = '0.0.5'
end
