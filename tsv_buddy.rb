# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    attributes = []
    output = []
    tsv.split("\n").each.with_index do |row, row_num|
      row_items = row.split("\t")
      if row_num.zero?
        attributes = row_items
      else
        output << construct_hash(attributes, row_items)
      end
    end
    @data = output
  end

  def construct_hash(attributes, row_data)
    new_hash = {}
    attributes.each.with_index do |hash_key, index|
      new_hash[hash_key] = row_data[index]
    end
    new_hash
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    output_str = "date\tstudent_id\tlanguages\tbest_language\tapp_experience\ttech_experience\n"
    @data.each.with_index do |hash_data, _index|
      hash_data.each.with_index do |(_key, value), idx|
        output_str += idx == hash_data.length - 1 ? "#{value}\n" : "#{value}\t"
      end
      # outputStr +=  "\n" unless index == @data.length - 1
    end
    output_str
  end
end
