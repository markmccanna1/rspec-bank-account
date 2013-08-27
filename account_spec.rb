require "rspec"

require_relative "account"

describe Account do

  let(:account) {Account.new("1234567890", 15)}

  describe "#initialize" do
    it "takes 2 arguments" do
      Account.should respond_to(:new).with(2).arguments
    end

    context "requires numeric argument" do
      it "should raise exception if not numeric" do
        expect { Account.new("foo") }.to raise_error(InvalidAccountNumberError)
      end
    end

    it "should be an instance of Account" do
      account.should be_an_instance_of Account
    end
  end

  describe "#transactions" do
    it "returns the correct transactions number" do
      account.transactions.should eql [15]
    end

    it "returns an array of transactions" do
      account.transactions.should be_an_instance_of Array
    end
  end

  describe "#balance" do
    it "returns the correct balance" do
      account.balance.should eql 15
    end
  end

  describe "#account_number" do
    it "returns the correct account_number" do
      account.acct_number.should eql "******7890"
    end
  end

  describe "#deposit!" do
    it "should raise an exception if you deposit less than 0" do
      expect {account.deposit!(-5)}.to raise_error(NegativeDepositError)
    end

    it "should return the correct balance" do
      account.deposit!(5).should eql 20
    end
  end

  describe "#withdraw!" do
    it "should raise an exception if you withdraw more than your balance" do
      expect {account.withdraw!(100)}.to raise_error(OverdraftError)
    end

    it "should return the correct balance" do
      account.withdraw!(5).should eql 10
    end
  end
end
