class FDC
	
	def self.to_json s
		s.gsub("=>",":")	
	end

	def self.to_xml s
		n = 0
		name_parent = []
		sxml = ""
		for i in 0..s.length-1
			if (s[i..i+1] == "{\"") 
				sxml << "<"
				saux = s.clone
				n = n+1
				name_parent[n] = saux.slice(i+2..(saux.index('"', i+2)-1))
				if (!name_parent[n].nil?) 
					sxml << name_parent[n] << ">"
				end
			elsif (s[i] == "}")
					sxml << "</" 
					print name_parent
					sxml << name_parent[n]
					n = n-1
					sxml << ">"
			elsif (s[i..i+1] == "=>")
				if (s[i+2] == "[")
				elsif saux = s.clone
				sxml << saux.slice(i+2..(saux.index("}", i+2)-1))
end
			end
		end
	sxml
	end

	protected
	
	def self.transform_symbols_to_string s
		is_string=false
		for i in 0..s.length-1 
			if (s[i]=="\"") 
				is_string != is_string
			end
		end
	end

end
