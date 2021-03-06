describe IncomeTax::Countries::SouthSudan do
  subject(:result) { described_class.new(income: income, income_type: type) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(8, 125)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9360                         }
    its(:taxes)        { should be == 640                          }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(22, 189)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 88360                        }
    its(:taxes)        { should be == 11640                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(172, 1147)          }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 85003360                     }
    its(:taxes)        { should be == 14996640                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(16, 241)            }
    its(:gross_income) { should be == "10711.1111111111111".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "711.11111111111111".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(33, 274)            }
    its(:gross_income) { should be == "113694.117647058824".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "13694.1176470588235".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(196, 1307)          }
    its(:gross_income) { should be == "117643105.882352941".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "17643105.882352941".to_d    }
  end
end
