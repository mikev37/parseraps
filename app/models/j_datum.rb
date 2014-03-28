require 'rubygems'
require 'json'

class JDatum < ActiveRecord::Base
	after_validation :setoutput



	private 

	def checker
		puts "testing"
	end

	def setoutput
		parsed = JSON.parse(self.jInput)
		self.jOutput = init_parse(parsed)
	end

	def init_parse(temp_parsed)
		output = ""
		temp_parsed.each do |key, value|
			if value.class == Array
				output += "#{key} : \n"
				output += '<DL>'
				output += multi_level(value, 1)
				output += '</DL>'
			else
				output += "#{key} : #{value}\n"
			end
		end

		return output
	end
	# Recursively check arrays in hashes in order to get full depth 
	# Use tab ahead of printing key value pairs to 
	def multi_level(check , number)
		extra_output = ""
		check.each do |x|
			if x.class == Hash
				x.each do |key,value|
					if value.class == Array
						extra_output += '<DD>'
						extra_output += "#{key} : \n"
						# extra_output += '</DD>'
						number += 1
						extra_output += '<DL>'
						extra_output += multi_level(value, number)
						extra_output += '</DL>'
						number -= 1
					else 
						extra_output += '<DD>'
						extra_output += "#{key} : #{value}\n"
						extra_output += '</DD'
					end
				end
			else
				text = x.split
				
				# j used to mark the initial entry and allow for marking with '-'
				j = 0
				# Use of n as a delimiter for number of words per line
				# Random number chosen for default line length (can be changed)
				n = 0
				extra_output += '<DD>'
				text.each do |t|
					if n == 13
						extra_output += "#{t}"
						n = 0
					else
						if n == 0 && j == 0
							# number.times {extra_output += "\t"}
							extra_output += "- "
							j += 1
						elsif n == 0
							# number.times {extra_output += "\t"}
						end
						extra_output += "#{t} "
						n += 1
					end
				end
				# Issue encountered when line length == limit
				# n != 0 mitigates issue with extra /n 
				if n != 0
					extra_output += "\n"
				end
			end
			extra_output += '</DD>'
		end

		return extra_output
	end
end
