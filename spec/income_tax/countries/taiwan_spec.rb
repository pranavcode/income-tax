describe IncomeTax::Countries::Taiwan do
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
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 950                          }
    its(:taxes)        { should be == 50                           }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9500                         }
    its(:taxes)        { should be == 500                          }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 95000                        }
    its(:taxes)        { should be == 5000                         }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(71, 181)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 60774400                     }
    its(:taxes)        { should be == 39225600                     }
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
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == "1052.63157894736842".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "52.631578947368421".to_d    }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == "10526.3157894736842".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "526.31578947368421".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == "105263.157894736842".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "5263.15789473684211".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(236, 597)           }
    its(:gross_income) { should be == 165376000                    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == 65376000                     }
  end
end
