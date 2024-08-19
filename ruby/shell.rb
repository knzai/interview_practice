#!/usr/bin/env ruby
# frozen_string_literal: true

#============================
# REQUIRES/DEPS
#============================
require 'optparse'

#============================
# CONSTANTS & DEFAULTS
#============================
# constants
SCRIPT_NAME = 'example.rb'
VERSION_NUM = '0.1'
RESET = `tput setaf 7`.freeze
RED = `tput setaf 1`.freeze
GREEN = `tput setaf 2`.freeze
BLUE = `tput setaf 4`.freeze
CYAN = `tput setaf 6`.freeze
YELLOW = `tput setaf 3`.freeze

#============================
# USAGE & METADATA
#============================
def usage
  <<~USAGE
    #{CYAN}Name:#{RESET} #{SCRIPT_NAME} #{VERSION_NUM}
    #{CYAN}Description:#{RESET}
    #{CYAN}Usage:#{RESET}#{' '}
    #{RED}<ENV>#{RESET} ./#{SCRIPT_NAME} #{YELLOW}[-h, --help] [-v --version] [-e --example #{RED}<arg>#{YELLOW}]#{RESET}
    #{CYAN}Environoment variables:#{RESET}
        FOO                              REQUIRED
    #{CYAN}Positional Arguments:#{RESET}
        ARGV[0]                          Name to address greeting to
    #{CYAN}Flags and Options:#{RESET}
  USAGE
end

# Ruby's default CLI flag and option parsing
# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
class Parser
  def self.parse(options)
    #stick parsed args in here for usage
    args = Hash.new

    opt_parser = OptionParser.new do |opts|
      opts.banner = usage

      opts.on('-h', '--help', 'Prints this help') do
        warn opts
        warn examples
        exit
      end

      opts.on('-v', 'Output version info.') do
        warn version
        exit
      end

      opts.on('--version', 'Output version with more metadata') do
        warn metadata
        exit
      end

      opts.on('-gGREETING', "--greeting=GREETING", 'Greeting to address to ARGV[0]') do |name|
        args[:name] = name
      end
    end

    opt_parser.parse!(options)
    args
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def examples
  <<~EXAMPLES
    #{CYAN}Examples#{RESET}
       #{BLUE}# Standard usage#{RESET}
       ./#{SCRIPT_NAME} args
  EXAMPLES
end

def version
  "#{SCRIPT_NAME} #{VERSION_NUM}"
end

def metadata
  <<~METADATA
    #{CYAN}Authour & Copyright:#{RESET}
       #{BLUE}version#{RESET}     #{SCRIPT_NAME} #{VERSION_NUM}
       #{BLUE}author#{RESET}      Kenzi Connor
       #{BLUE}copyright#{RESET}   Copyright (c) Public Domain
       #{BLUE}license#{RESET}     Public Domain via Unlicense (see footer)
       #{BLUE}site#{RESET}        knz.ai/
       #{BLUE}source#{RESET}      gist.github.com/
    #{CYAN}Version history:#{RESET}
       #{BLUE}2024/07/10#{RESET} : 0.0.1 : Script creation
  METADATA
end

#============================
# MAIN
#============================
def my_function
  options = Parser.parse ARGV
  puts "#{ARGV[0]} #{options[:name]}"
  0
end
my_function

#===============================================================================
# LICENSE: Public Domain via Unlicense
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>
