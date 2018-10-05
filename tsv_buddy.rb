# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    attributes = []
    outputData = []
    rows = tsv.split("\n")
    rows.each.with_index do |row, row_num|
      if row_num == 0
        attributes = row.split("\t")
      else
        tmpHash = {}
        rowData = row.split("\t")
        attributes.each.with_index do |hashKey, index|
          tmpHash[hashKey] = rowData[index]
        end
        outputData << tmpHash
      end
    end
    @data = outputData
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    outputStr = "date\tstudent_id\tlanguages\tbest_language\tapp_experience\ttech_experience\n"
    @data.each.with_index do |hashData, index|
      hashData.each.with_index do |(_key, value), idx|
        outputStr += idx == hashData.length - 1 ? value : "#{value}\t"
      end
      # outputStr +=  "\n" unless index == @data.length - 1
      outputStr +=  "\n"
    end
    outputStr
  end
  
end
