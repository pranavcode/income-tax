module IncomeTax
  module Countries
    class Switzerland
      class Jura < Canton
        register "Jura", "JU"
        lazy { @levels = Marshal.load(File.open("#{__dir__}/data/jura.dat")) }
        municipal_multiplier Rational(195, 285)
      end
    end
  end
end
