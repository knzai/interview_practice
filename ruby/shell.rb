#!/usr/bin/env ruby
# frozen_string_literal: true

#============================
# REQUIRES/DEPS
#============================
require 'optparse'

#============================
# CONSTANTS & DEFAULTS
#============================
SCRIPT_NAME = 'example.rb'
VERSION_NUM = '0.1'
# colored terminal output
BLACK   = `tput setaf 0`.freeze
RED     = `tput setaf 1`.freeze
GREEN   = `tput setaf 2`.freeze
YELLOW  = `tput setaf 3`.freeze
BLUE    = `tput setaf 4`.freeze
MAGENTA = `tput setaf 5`.freeze
CYAN    = `tput setaf 6`.freeze
RESET   = WHITE = `tput setaf 7`.freeze

#============================
# USAGE & METADATA
#============================
class ArgParser
  def self.usage
    <<~USAGE
      #{CYAN}Name:#{RESET} #{script_name} #{VERSION_NUM}
      #{CYAN}Description:#{RESET}
      #{CYAN}Usage:#{RESET}#{' '}
      #{RED}<ENV>#{RESET} ./#{script_name} #{YELLOW}[-h, --help] [-v --version] [-e --example #{RED}<arg>#{YELLOW}]#{RESET}
      #{CYAN}Environoment variables:#{RESET}
          FOO                              REQUIRED
      #{CYAN}Positional Arguments:#{RESET}
          ARGV[0]                          Name to address greeting to
      #{CYAN}Flags and Options:#{RESET}
    USAGE
  end

  def self.examples
    <<~EXAMPLES
      #{CYAN}Examples#{RESET}
         #{BLUE}# Standard usage#{RESET}
         ./#{script_name} args
    EXAMPLES
  end

  def self.version
    "#{script_name} #{VERSION_NUM}"
  end

  def self.metadata
    <<~METADATA
      #{CYAN}Authour & Copyright:#{RESET}
         #{BLUE}version#{RESET}     #{script_name} #{VERSION_NUM}
         #{BLUE}author#{RESET}      Kenzi Connor
         #{BLUE}copyright#{RESET}   Copyright (c) Public Domain
         #{BLUE}license#{RESET}     Public Domain via Unlicense (see footer)
         #{BLUE}site#{RESET}        knz.ai/
         #{BLUE}source#{RESET}      gist.github.com/
      #{CYAN}Version history:#{RESET}
         #{BLUE}2024/07/10#{RESET} : 0.0.1 : Script creation
    METADATA
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def self.option_parser
    @option_parser ||= OptionParser.new do |opts|
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

      opts.on('-gGREETING', '--greeting=GREETING', 'Greeting to address to ARGV[0]')
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def self.parse
    args = {}
    option_parser.parse!(into: args)
    die 'missing required positional parameter' unless (args[:name] = ARGV[0])
    args
  end

  def self.script_name
    "#{GREEN}#{SCRIPT_NAME}#{RESET}"
  end
end

#============================
# MESSAGING
#============================
def die(output)
  warn output
  exit 2
end

#============================
# MAIN
#============================
def my_function
  args = ArgParser.parse
  puts "#{args[:greeting]} #{args[:name]}"
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
