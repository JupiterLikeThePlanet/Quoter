# encoding: utf-8
#
# Licensed to the Software Freedom Conservancy (SFC) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The SFC licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Selenium
  module WebDriver
    module Keys

      #
      # @see Element#send_keys
      # @see http://www.google.com.au/search?&q=unicode+pua&btnG=Search
      #

      KEYS = {
      # \x works on both 1.8.6/1.9
        :null         => "\xEE\x80\x80",
        :cancel       => "\xEE\x80\x81",
        :help         => "\xEE\x80\x82",
        :backspace    => "\xEE\x80\x83",
        :tab          => "\xEE\x80\x84",
        :clear        => "\xEE\x80\x85",
        :return       => "\xEE\x80\x86",
        :enter        => "\xEE\x80\x87",
        :shift        => "\xEE\x80\x88",
        :left_shift   => "\xEE\x80\x88",
        :control      => "\xEE\x80\x89",
        :left_control => "\xEE\x80\x89",
        :alt          => "\xEE\x80\x8A",
        :left_alt     => "\xEE\x80\x8A",
        :pause        => "\xEE\x80\x8B",
        :escape       => "\xEE\x80\x8C",
        :space        => "\xEE\x80\x8D",
        :page_up      => "\xEE\x80\x8E",
        :page_down    => "\xEE\x80\x8F",
        :end          => "\xEE\x80\x90",
        :home         => "\xEE\x80\x91",
        :left         => "\xEE\x80\x92",
        :arrow_left   => "\xEE\x80\x92",
        :up           => "\xEE\x80\x93",
        :arrow_up     => "\xEE\x80\x93",
        :right        => "\xEE\x80\x94",
        :arrow_right  => "\xEE\x80\x94",
        :down         => "\xEE\x80\x95",
        :arrow_down   => "\xEE\x80\x95",
        :insert       => "\xEE\x80\x96",
        :delete       => "\xEE\x80\x97",
        :semicolon    => "\xEE\x80\x98",
        :equals       => "\xEE\x80\x99",
        :numpad0      => "\xEE\x80\x9A",
        :numpad1      => "\xEE\x80\x9B",
        :numpad2      => "\xEE\x80\x9C",
        :numpad3      => "\xEE\x80\x9D",
        :numpad4      => "\xEE\x80\x9E",
        :numpad5      => "\xEE\x80\x9F",
        :numpad6      => "\xEE\x80\xA0",
        :numpad7      => "\xEE\x80\xA1",
        :numpad8      => "\xEE\x80\xA2",
        :numpad9      => "\xEE\x80\xA3",
        :multiply     => "\xEE\x80\xA4",
        :add          => "\xEE\x80\xA5",
        :separator    => "\xEE\x80\xA6",
        :subtract     => "\xEE\x80\xA7",
        :decimal      => "\xEE\x80\xA8",
        :divide       => "\xEE\x80\xA9",
        :f1           => "\xEE\x80\xB1",
        :f2           => "\xEE\x80\xB2",
        :f3           => "\xEE\x80\xB3",
        :f4           => "\xEE\x80\xB4",
        :f5           => "\xEE\x80\xB5",
        :f6           => "\xEE\x80\xB6",
        :f7           => "\xEE\x80\xB7",
        :f8           => "\xEE\x80\xB8",
        :f9           => "\xEE\x80\xB9",
        :f10          => "\xEE\x80\xBA",
        :f11          => "\xEE\x80\xBB",
        :f12          => "\xEE\x80\xBC",
        :meta         => "\xEE\x80\xBD",
        :command      => "\xEE\x80\xBD" # alias
      }

      #
      # @api private
      #

      def self.[](key)
        KEYS[key] or raise Error::UnsupportedOperationError, "no such key #{key.inspect}"
      end

      #
      # @api private
      #

      def self.encode(keys)
        keys.map do |arg|
          case arg
          when Symbol
            Keys[arg]
          when Array
            arg = arg.map { |e| e.kind_of?(Symbol) ? Keys[e] : e }.join
            arg << Keys[:null]

            arg
          else
            arg.to_s
          end
        end
      end

    end # Keys
  end # WebDriver
end # Selenium
