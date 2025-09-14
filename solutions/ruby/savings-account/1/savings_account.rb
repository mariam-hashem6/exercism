module SavingsAccount
  INTEREST_RATES = {
    negative: 3.213,
    low: 0.5,
    medium: 1.621,
    high: 2.475
  }.freeze

  BALANCE_THRESHOLDS = {
    low: 0,
    medium: 1000,
    high: 5000
  }.freeze

  def self.interest_rate(balance)
    case balance
    when -Float::INFINITY...0 then INTEREST_RATES[:negative]
    when 0...BALANCE_THRESHOLDS[:medium] then INTEREST_RATES[:low]
    when BALANCE_THRESHOLDS[:medium]...BALANCE_THRESHOLDS[:high] then INTEREST_RATES[:medium]
    else INTEREST_RATES[:high]
    end
  end

  def self.annual_balance_update(balance)
    balance * (1 + interest_rate(balance) / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    return 0 if current_balance >= desired_balance
    annual_balances = Enumerator.produce(current_balance) do |balance|
      annual_balance_update(balance)
    end
     annual_balances.each_with_index.find { |balance, year| balance >= desired_balance }[1]
  end
end
