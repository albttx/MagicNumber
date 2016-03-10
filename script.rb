#!/usr/bin/ruby

require "Prime"

class Array
	def to_i
		str = ""
		self.each { |e| str += e.to_s }
		return str.to_i
	end
end

class MagicNumber
	@@ret = []

	def initialize(nb)
		init_ret() if @@ret.empty?
		nbrs = nb.to_s.split('').map(&:to_i)
		tabs = []
		for index in (0..@@ret.size - 1) do
			return false if nbrs.include?(index) != @@ret[index].call(nbrs)
		end
		puts "The Magic Number is : #{nb}"
		exit
	end

	def init_ret
		@@ret << method(:digitSumOthers)
		@@ret << method(:sumDivisorsGreater)
		@@ret << method(:twoOddDigit)
		@@ret << method(:allDigitAreDifferent)
		@@ret << method(:digit4IsEven)
		@@ret << method(:productNotMultiple5)
		@@ret << method(:threeOddDigitInRow)
		@@ret << method(:isPrime)
		@@ret << method(:twoEvenDigitInRow)
		@@ret << method(:allOddDigitSquare)
	end

	# Property 0
	def digitSumOthers(nbrs)
		sum = nbrs.reduce(:+)
		nbrs.each do |nb|
			return true if nb == sum - nb
		end
		return false
	end

	# Property 1
	def sumDivisorsGreater(nbrs)
		nb = nbrs.to_i
		sum = 0
		(1..nb).each do |n|
			sum += n if nb % n == 0
		end
		return sum >= nb
	end

	# Property 2
	def twoOddDigit(nbrs)
		odd = 0
		nbrs.each { |nb| odd += 1 if nb.odd? }
		return odd >= 2
	end

	# Property 3
	def allDigitAreDifferent(nbrs)
		ret = nbrs.each.find { |c| nbrs.count(c) > 1 }
		return ret == nil
	end

	# Property 4
	def digit4IsEven(nbrs)
		return true if nbrs[3] && nbrs[3].even?
		return false
	end

	# Property 5
	def productNotMultiple5(nbrs)
		all = 1
		nbrs.each { |n| all *= n}
		return all % 5 != 0
	end

	def detectDigitInRow(nbrs, howmany, odd)
		cpy = nbrs.dup
		nbrs.each do |n|
			nb = cpy.first(howmany)
			return true if nb.size == howmany && nb.all? { |e| e.odd? == odd }
			cpy.shift
		end
		return false
	end

	# Property 6
	def threeOddDigitInRow(nbrs)
		detectDigitInRow(nbrs, 3, true)
	end

	# Property 7
	def isPrime(nbrs)
		return Prime.prime?(nbrs.to_i)
	end

	# Property 8
	def twoEvenDigitInRow(nbrs)
		return detectDigitInRow(nbrs, 2, false)
	end

	# Property 9
	def allOddDigitSquare(nbrs)
		tt = 1
		nbrs.each { |n| tt *= n if n.odd? }
		return false if tt == 1
		sqrt = Math.sqrt(tt)
		return sqrt.round == sqrt
	end
end

# ---------------- MAIN --------------------- #
limit = 10000
for n in (0..limit)
	MagicNumber.new(n)
end
