module IncomeTax
  module Countries
    class Switzerland
      class Uri < Canton
        register "Uri", "UR"
        lazy { @levels = Marshal.load(File.open("#{__dir__}/data/uri.dat")) }
        municipal_multiplier "99%"
      end
    end
  end
end
