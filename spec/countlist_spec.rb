require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Countlist' do
  it "exists" do
    Countlist.should_not be_nil
  end
  it "can be extended" do
    Object.extend(Countlist).should be_true
  end

  context "when extended" do
    let(:object) {Object.new.extend(Countlist::Countries)}
    it "returns hash with Czech Republic" do
      object.countries['CZ'].should == 'Czech Republic'
    end
    it "returns all countries" do
      object.countries.size.should == 249
    end
    it "returns hash with all three letters iso codes" do
      object.iso_codes['CZ'].first.should == 'CZE'
    end
    it "returns hash with all numbers iso codes" do
      object.iso_codes['CZ'].last.should == 203
    end
    it "returns three letters iso code" do
      object.iso_code('CZ').should == 'CZE'
    end
    it "returns number iso code" do
      object.number_iso_code('CZ').should == 203
    end
    it "returns country code from country name" do
      object.country_code('Czech Republic').should == 'CZ'
    end
    it "returns all country names" do
      object.country_names[59].should == 'Czech Republic'
    end
    it "returns all us states" do
      object.states('US')['AL'].should == 'Alabama'
    end
    it "returns all countries with states" do
      object.countries_with_states.should == ["AU", "BR", "CA", "CU", "DE",
                                              "DK", "ES", "HR", "IN", "IT",
                                              "MX", "NO", "NZ", "UA", "US"]
    end
  end
end
