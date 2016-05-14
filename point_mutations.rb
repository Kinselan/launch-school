# Rubocop, here is your top-level class documentation comment!
class DNA
  def initialize(input_strand)
    @input_strand = input_strand
  end

  def comparable_length(strand_a, strand_b)
    if strand_a.size <= strand_b.size
      strand_a.size
    else
      strand_b.size
    end
  end

  def convert_strand(strand)
    if strand == ''
      ['']
    else
      strand.chars
    end
  end

  def hamming_distance(strand_b)
    distance = 0
    strand_a = @input_strand

    number_of_bases_to_compare = comparable_length(strand_a, strand_b)

    strand_a = convert_strand(strand_a)
    strand_b = convert_strand(strand_b)

    i = 0
    while i < number_of_bases_to_compare
      distance += 1 unless strand_a[i] == strand_b[i]
      i += 1
    end

    distance
  end
end
