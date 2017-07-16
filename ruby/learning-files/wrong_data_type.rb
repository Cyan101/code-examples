 unless sentence.respond_to? :include?
    raise ArgumentError,
      "can only edit strings, you sent a #{ sentence.class }"
 end
