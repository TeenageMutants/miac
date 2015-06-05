class Statistic < ActiveRecord::Base
	
# 	PLACE = {1 => {:name => "1 Стол"}, 2 => {:name => "2 Стол"}, 3 => {:name => "3 Стол"}, 4 => {:name => "4 Стол"}, 5 => {:name => "5 Стол"}, 6 => {:name => "6 Стол"}, 7 => {:name => "7 Стол"}, 8 => {:name => "8 Стол"}, 9 => {:name => "9 Стол"}, 10 => {:name => "1 Барное место "}, 11 => {:name => "2 Барное место "}, 12 => {:name => "3 Барное место "}}
# 	TYPES = {1 => {:name => "Посадка"}, 2 => {:name => "Мастер-класс"},3 => {:name => "Игры"}}
# 	MODERNIZACIA = {Date.parse('01.01.2010') => {:people => "11483", :comp => "2476"}, Date.parse('01.01.2011') => {:people => "11294", :comp => "2639"},Date.parse('01.01.2012') => {:people => "11279", :comp => "4877"},
# Date.parse('01.01.2013') => {:people => "11192", :comp => "5269"}, Date.parse('01.01.2014') => {:people => "11163", :comp => "5658"}}


	MEDICS = {Date.parse('01.01.2010')  => {:people => "11483"}, Date.parse('01.01.2011')  => {:people => "11294"},Date.parse('01.01.2012')  => {:people => "11279"}, Date.parse('01.01.2013') => {:people => "11192"}, Date.parse('01.01.2014')  => {:people => "11163"}}
	COMPS = {Date.parse('01.01.2010')  => {:comp => "2476"}, Date.parse('01.01.2011')  => { :comp => "2639"},Date.parse('01.01.2012')  => {:comp => "4877"},Date.parse('01.01.2013') => {:comp => "5269"}, Date.parse('01.01.2014')  => {:comp => "5658"}}

# 	MOD_ONE = {Date.parse('01.01.2010') => {:people => "11483"}, Date.parse('01.02.2010') => {:comp => "2476"}, Date.parse('01.01.2011') => {:people => "11294"}, Date.parse('01.02.2011') => {:comp => "2639"}, Date.parse('01.01.2012')=> {:people => "11279"}, Date.parse('01.02.2012') => {:comp => "4877"},
# Date.parse('01.01.2013') => {:people => "11192"}, Date.parse('01.02.2013') => {:comp => "5269"}, Date.parse('01.01.2014') => {:people => "11163"}, Date.parse('01.02.2014') => {:comp => "5658"}}

	MOD_ONE = {"1223" => {:people => "11483", :comp => "2476"}, "1224" => {:people => "11294", :comp => "2639"}, "1225"=> {:people => "11279", :comp => "4877"}, "1226" => {:people => "11192", :comp => "5269"}, "1227" => {:people => "11163", :comp => "5658"}}
end
