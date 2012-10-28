class FDC
		
	def self.from_json s
		s.gsub(":","=>")
	end
	
	def self.from_hash s
		s
	end

	def self.from_activerecord s
		records=[]
		vector = false		
		if s[0]=="["
			hash="["
			s=s[1..s.length-2]
			records=s.split(">, #<")
			vector = true
		else
			hash=""
			records[0]=s
		end
		records.each do |record|
			record = record[1..record.length-1] if record[0]==" "
			record = record[2..record.length-1] if record[0..1]=="#<"
			record = record[0..record.length-2] if record[record.length-1]==">"
			hash=hash+"{"
			name_finishes=record.index(" ")
			record_name=record[0..name_finishes-1	]
			hash=hash+"\"name\" => \"" + record_name +"\", \"record\" => {"
			entries = record[name_finishes+1..record.length-1].split(",")
			entries.each do |entry|
				hash=hash+"\""+entry[0..entry.index(":")-1]+"\" => "+entry[entry.index(":")+2..entry.length-1]+"," if entry[entry.index(":")+2..entry.length-1] != "nil"
			end
			hash=hash[0..hash.length-2]
			hash=hash+"}},"
		end		
		hash=hash[0..hash.length-2]
		hash=hash+"]" if vector
		hash
	end

end