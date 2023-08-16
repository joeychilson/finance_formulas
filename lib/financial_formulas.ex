defmodule FinancialFormulas do
  @doc """
  Calculates the annual percentage yield (APY) of an investment.

  The annual percentage yield is the the rate of interest that is earned when taking into consideration the effect of compounding.

  ## Formula

  (1 + interest_rate / number_of_times_compounded) ^ number_of_times_compounded - 1

  ## Required

  * `nominal_interest_rate` - The nominal interest rate of the investment.
  * `number_of_times_compounded` - The number of times the interest is compounded per year.

  ## Examples

  iex> FinancialFormulas.annual_percentage_yield(0.025, 12)
  0.025288456983290075
  """
  def annual_percentage_yield(nominal_interest_rate, number_of_times_compounded) do
    :math.pow(1 + nominal_interest_rate / number_of_times_compounded, number_of_times_compounded) -
      1
  end

  @doc """
  Calculates the asset to sales ratio of an entity.

  ## Formula

  total_asset / total_sales

  ## Required

  * `total_assets` - The total assets of the entity.
  * `sales_revenue` - The sales/revenue of the entity.

  ## Examples

  iex> FinancialFormulas.asset_to_sales_ratio(100000, 50000)
  2.0
  """
  def asset_to_sales_ratio(total_assets, sales_revenue)
      when sales_revenue != 0,
      do: total_assets / sales_revenue

  @doc """
  Calculates the asset turnover ratio of an entity.

  ## Formula

  total_sales / total_asset

  ## Required

  * `sales_revenue` - The sales/revenue of the entity.
  * `total_asset` - The total assets of the entity.

  ## Examples

  iex> FinancialFormulas.asset_turnover_ratio(50000, 100000)
  0.5
  """
  def asset_turnover_ratio(sales_revenue, total_assets)
      when total_assets != 0,
      do: sales_revenue / total_assets

  @doc """
  Calculates the average collection period of an entity.

  ## Formula

  365 / receivables_turnover_ratio

  ## Required

  * `receivables_turnover_ratio` - The receivables turnover ratio of the entity.

  ## Examples

  iex> FinancialFormulas.average_collection_period(10)
  36.5
  """
  def average_collection_period(receivables_turnover_ratio)
      when receivables_turnover_ratio != 0,
      do: 365 / receivables_turnover_ratio

  @doc """
  Calculates the average inventory of an entity.

  ## Formula

  (ending_inventory + beginning_inventory) / number_of_periods

  ## Required

  * `ending_inventory` - The ending inventory of the entity.
  * `beginning_inventory` - The beginning inventory of the entity.

  ## Optional

  * `number_of_periods` - The number of periods. Defaults to 2.

  ## Examples

  iex> FinancialFormulas.average_inventory(100, 50)
  75.0

  iex> FinancialFormulas.average_inventory(100, 50, 3)
  50.0
  """
  def average_inventory(ending_inventory, beginning_inventory, number_of_periods \\ 2)
      when number_of_periods != 0,
      do: (ending_inventory + beginning_inventory) / number_of_periods

  @doc """
  Calculates the average inventory period of an entity.

  ## Formula

  number_of_days_in_period / inventory_turnover

  ## Required

  * `inventory_turnover` - The inventory turnover of the entity.

  ## Optional

  * `days_in_period` - The number of days in the period. Defaults to 365.

  ## Examples

  iex> FinancialFormulas.average_inventory_period(10)
  36.5

  iex> FinancialFormulas.average_inventory_period(10, 180)
  18.0
  """
  def average_inventory_period(inventory_turnover, days_in_period \\ 365)
      when days_in_period != 0,
      do: days_in_period / inventory_turnover

  @doc """
  Calculates the average payment period of an entity.

  ## Formula

  average_accounts_payable / (credit_purchases / days_in_period)

  ## Required

  * `average_accounts_payable` - The average accounts payable of the entity.
  * `credit_purchases` - The credit purchases of the entity.

  ## Optional

  * `days_in_period` - The number of days in the period.

  ## Examples

  iex> FinancialFormulas.average_payment_period(23000, 100000)
  83.95

  iex> FinancialFormulas.average_payment_period(100, 200, 180)
  90.0
  """
  def average_payment_period(average_accounts_payable, credit_purchases, days_in_period \\ 365)
      when days_in_period != 0,
      do: average_accounts_payable / (credit_purchases / days_in_period)

  @doc """
  Calculates the bid ask spread of a security.

  ## Formula

  ask_price - bid_price

  ## Required

  * `ask_price` - The ask price of the security.
  * `bid_price` - The bid price of the security.

  ## Example

  iex> FinancialFormulas.bid_ask_spread(10, 8)
  2
  """
  def bid_ask_spread(ask_price, bid_price), do: ask_price - bid_price

  @doc """
  Calculates the bond equivalent yield of a bond.

  ## Formula

  (face_value - bond_price) / bond_price * (365 / days)

  ## Required

  * `face_value` - The face value of the bond.
  * `purchase_price` - The purchase price of the bond.

  ## Optional

  * `days_to_maturity` - The number of days until the bond matures. Defaults to 365.

  ## Examples

  iex> FinancialFormulas.bond_equivalent_yield(110, 100, 180)
  0.20277777777777778

  iex> FinancialFormulas.bond_equivalent_yield(110, 100)
  0.1
  """
  def bond_equivalent_yield(face_value, purchase_price, days_to_maturity \\ 365)
      when purchase_price != 0 and days_to_maturity != 0,
      do: (face_value - purchase_price) / purchase_price * 365 / days_to_maturity

  @doc """
  Calculates the book value per share of an entity.

  ## Formula

  (total_common_equity - perferred_equity) / weighted_average_number_of_shares_outstanding

  ## Required

  * `shareholders_equity` - The shareholders equity of the entity.
  * `perferred_equity` - The perferred equity of the entity.
  * `weighted_average_number_of_shares_outstanding` - The weighted average number of shares outstanding of the entity.

  ## Examples

  iex> FinancialFormulas.book_value_per_share(100, 10, 10)
  9.0
  """
  def book_value_per_share(
        shareholders_equity,
        perferred_equity,
        weighted_average_number_of_shares_outstanding
      )
      when weighted_average_number_of_shares_outstanding != 0,
      do: (shareholders_equity - perferred_equity) / weighted_average_number_of_shares_outstanding

  @doc """
  Calculates the capital asset pricing model (CAPM).

  ## Formula

  risk_free_rate + beta * (expected_market_return - risk_free_rate)

  ## Required

  * `risk_free_rate` - The risk free rate.
  * `beta` - The beta of the investment.
  * `market_retrun` - The return on the market.

  ## Examples

  iex> FinancialFormulas.capital_asset_pricing_model(0.03, 0.8, 0.1)
  0.08600000000000001
  """
  def capital_asset_pricing_model(risk_free_rate, beta, market_retrun),
    do: risk_free_rate + beta * (market_retrun - risk_free_rate)

  @doc """
  Calculates the capital gains yield of an investment.

  ## Formula

  (final_price - initial_price) / initial_price

  ## Required

  * `initial_price` - The initial price of the investment.
  * `final_price` - The final price of the investment.

  ## Examples

  iex> FinancialFormulas.capital_gains_yield(10, 12)
  0.2
  """
  def capital_gains_yield(initial_price, final_price)
      when initial_price != 0,
      do: (final_price - initial_price) / initial_price

  @doc """
  Calculates the cash conversion cycle of an entity.

  ## Formula

  days_inventory_outstanding + days_sales_outstanding - days_payable_outstanding

  ## Required

  * `days_inventory_outstanding` - The days inventory outstanding of the entity.
  * `days_sales_outstanding` - The days sales outstanding of the entity.
  * `days_payable_outstanding` - The days payable outstanding of the entity.

  ## Examples

  iex> FinancialFormulas.cash_conversion_cycle(82, 34, 66)
  50
  """
  def cash_conversion_cycle(
        days_inventory_outstanding,
        days_sales_outstanding,
        days_payable_outstanding
      ),
      do: days_inventory_outstanding + days_sales_outstanding - days_payable_outstanding

  @doc """
  Calculates compound interest

  ## Formula

  principal * (1 + rate_per_period / number_of_periods_per_year) ^ (number_of_periods_per_year * number_of_years)

  ## Required

  * `principal` - The principal amount.
  * `rate_per_period` - The interest rate per period.
  * `number_of_years` - The number of years.
  * `number_of_periods_per_year` - The number of periods per year. Defaults to 12.

  ## Examples

  iex> FinancialFormulas.compound_interest(5000, 0.05, 10)
  8235.0474884514

  iex> FinancialFormulas.compound_interest(5000, 0.05, 10, 12)
  8235.0474884514
  """
  def compound_interest(
        principal,
        rate_per_period,
        number_of_years,
        number_of_periods_per_year \\ 12
      )
      when rate_per_period >= 0 and number_of_years >= 0 and number_of_periods_per_year > 0 do
    number_of_periods = number_of_periods_per_year * number_of_years
    principal * :math.pow(1 + rate_per_period / number_of_periods_per_year, number_of_periods)
  end

  @doc """
  Calculates the contribution margin

  ## Formula

  total_sales_revenue - variable_costs

  ## Required

  * `total_sales_revenue` - The total sales revenue
  * `variable_costs` - The variable costs

  ## Examples

  iex> FinancialFormulas.contribution_margin(1000, 500)
  500
  """
  def contribution_margin(total_sales_revenue, variable_costs),
    do: total_sales_revenue - variable_costs

  @doc """
  Calculates the contribution margin per unit

  ## Formula

  price_per_unit - variable_cost_per_unit

  ## Required

  * `price_per_unit` - The price per unit
  * `variable_cost_per_unit` - The variable cost per unit

  ## Examples

  iex> FinancialFormulas.contribution_margin_per_unit(10, 5)
  5
  """
  def contribution_margin_per_unit(price_per_unit, variable_cost_per_unit),
    do: price_per_unit - variable_cost_per_unit

  @doc """
  Calculates the contribution margin ratio

  ## Formula

  contribution_margin / total_sales_revenue

  ## Required

  * `contribution_margin` - The contribution margin
  * `total_sales_revenue` - The total sales revenue

  ## Examples

  iex> FinancialFormulas.contribution_margin_ratio(500, 1000)
  0.5
  """
  def contribution_margin_ratio(contribution_margin, total_sales_revenue)
      when total_sales_revenue != 0,
      do: contribution_margin / total_sales_revenue

  @doc """
  Calculates the continuous compounding of an investment.

  ## Formula

  principal * e ^ (rate * time)

  ## Required

  * `principal` - The principal amount.
  * `interest_rate` - The interest rate.
  * `time` - The time.

  ## Examples

  iex> FinancialFormulas.continuous_compounding(3000, 0.07, 5)
  4257.202645779772
  """
  def continuous_compounding(principal, interest_rate, time),
    do: principal * :math.exp(interest_rate * time)

  @doc """
  Calculates the costs of goods sold of an entity.

  ## Formula

  beginning_inventory + purchases - ending_inventory

  ## Required

  * `beginning_inventory` - The beginning inventory.
  * `purchases` - The purchases.
  * `ending_inventory` - The ending inventory.

  ## Examples

  iex> FinancialFormulas.cost_of_goods_sold(100, 200, 50)
  250
  """
  def cost_of_goods_sold(beginning_inventory, purchases, ending_inventory),
    do: beginning_inventory + purchases - ending_inventory

  @doc """
  Calculates the cost to income ratio of an entity.

  ## Formula

  operational_costs / operational_income

  ## Required

  * `operational_costs` - The operational costs of the entity.
  * `operational_income` - The operational income of the entity.

  ## Examples

  iex> FinancialFormulas.cost_to_income_ratio(100, 200)
  0.5
  """
  def cost_to_income_ratio(operational_costs, operational_income)
      when operational_income != 0,
      do: operational_costs / operational_income

  @doc """
  Calculates the current ratio of an entity.

  ## Formula

  current_assets / current_liabilities

  ## Required

  * `current_assets` - The current assets of the entity.
  * `current_liabilities` - The current liabilities of the entity.

  ## Examples

  iex> FinancialFormulas.current_ratio(100, 200)
  0.5
  """
  def current_ratio(current_assets, current_liabilities)
      when current_liabilities != 0,
      do: current_assets / current_liabilities

  @doc """
  Calculates the current yield of a bond.

  ## Formula

  annual_income / current_price

  ## Required

  * `annual_coupons` - The annual coupons of the bond.
  * `current_price` - The current price of the bond.

  ## Examples

  iex> FinancialFormulas.current_yield(100, 200)
  0.5
  """
  def current_yield(annual_coupons, current_price)
      when current_price != 0,
      do: annual_coupons / current_price

  @doc """
  Calculates the inventory turnover of an entity.

  ## Formula

  365 / inventory_turnover

  ## Required

  * `inventory_turnover` - The inventory turnover of the entity.

  ## Examples

  iex> FinancialFormulas.days_in_inventory(10)
  36.5
  """
  def days_in_inventory(inventory_turnover)
      when inventory_turnover != 0,
      do: 365 / inventory_turnover

  @doc """
  Calculates the days sales of inventory of an entity.

  ## Formula

  average_inventory / cost_of_goods_sold * 365

  ## Required

  * `average_inventory` - The average inventory of the entity.
  * `cost_of_goods_sold` - The cost of goods sold of the entity.

  ## Examples

  iex> FinancialFormulas.days_sales_of_inventory(100, 200)
  182.5
  """
  def days_sales_of_inventory(average_inventory, cost_of_goods_sold)
      when cost_of_goods_sold != 0,
      do: average_inventory / cost_of_goods_sold * 365

  @doc """
  Calculates the days sales outstanding of an entity.

  ## Formula

  accounts_receivable / total_credit_sales * 365

  ## Required

  * `accounts_receivable` - The accounts receivable of the entity.
  * `total_credit_sales` - The total credit sales of the entity.

  ## Examples

  iex> FinancialFormulas.days_sales_outstanding(100, 200)
  182.5
  """
  def days_sales_outstanding(accounts_receivable, total_credit_sales)
      when total_credit_sales != 0,
      do: accounts_receivable / total_credit_sales * 365

  @doc """
  Calculates the days payable outstanding of an entity.

  ## Formula

  accounts_payable / cost_of_goods_sold * 365

  ## Required

  * `accounts_payable` - The accounts payable of the entity.
  * `cost_of_goods_sold` - The cost of goods sold of the entity.

  ## Examples

  iex> FinancialFormulas.days_payable_outstanding(100, 200)
  182.5
  """
  def days_payable_outstanding(accounts_payable, cost_of_goods_sold)
      when cost_of_goods_sold != 0,
      do: accounts_payable / cost_of_goods_sold * 365

  @doc """
  Calculates the debt coverage ratio of an entity.

  ## Formula

  net_operating_income / total_debt_service

  ## Required

  * `net_operating_income` - The net operating income of the entity.
  * `total_debt_service` - The total debt service of the entity.

  ## Examples

  iex> FinancialFormulas.debt_coverage_ratio(100, 200)
  0.5
  """
  def debt_coverage_ratio(net_operating_income, total_debt_service)
      when total_debt_service != 0,
      do: net_operating_income / total_debt_service

  @doc """
  Calculates the debt ratio of an entity.

  ## Formula

  total_liabilities / total_assets

  ## Required

  * `total_liabilities` - The total liabilities of the entity.
  * `total_assets` - The total assets of the entity.

  ## Examples

  iex> FinancialFormulas.debt_ratio(100, 200)
  0.5
  """
  def debt_ratio(total_liabilities, total_assets)
      when total_assets != 0,
      do: total_liabilities / total_assets

  @doc """
  Calculates the debt to equity ratio of an entity.

  ## Formula

  total_liabilities / total_equity

  ## Required

  * `total_liabilities` - The total liabilities of the entity.
  * `total_equity` - The total equity of the entity.

  ## Examples

  iex> FinancialFormulas.debt_to_equity_ratio(100, 200)
  0.5
  """
  def debt_to_equity_ratio(total_liabilities, total_equity)
      when total_equity != 0,
      do: total_liabilities / total_equity

  @doc """
  Calculates the debt to income ratio of an entity.

  ## Formula

  debt / income

  ## Required

  * `debt` - The total debt of the entity.
  * `income` - The total income of the entity.

  ## Examples

  iex> FinancialFormulas.debt_to_income_ratio(100, 200)
  0.5
  """
  def debt_to_income_ratio(debt, income)
      when income != 0,
      do: debt / income

  @doc """
  Calculates the diluted earnings per share of an entity.

  ## Formula

  net_income / (average_shares + other_convertible_instruments)

  ## Required

  * `net_income` - The net income of the entity.
  * `average_shares` - The average shares of the entity.
  * `other_convertible_instruments` - The other convertible instruments of the entity.

  ## Examples

  iex> FinancialFormulas.diluted_earnings_per_share(100, 200, 300)
  0.2

  iex> FinancialFormulas.diluted_earnings_per_share(100, 200)
  0.5
  """
  def diluted_earnings_per_share(net_income, average_shares, other_convertible_instruments \\ 0)
      when average_shares + other_convertible_instruments != 0,
      do: net_income / (average_shares + other_convertible_instruments)

  @doc """
  Calculates the dividend payout ratio of an entity.

  ## Formula

  dividends / net_income

  ## Required

  * `dividends` - The dividends of the entity.
  * `net_income` - The net income of the entity.

  ## Examples

  iex> FinancialFormulas.dividend_payout_ratio(100, 200)
  0.5
  """
  def dividend_payout_ratio(dividends, net_income)
      when net_income != 0,
      do: dividends / net_income

  @doc """
  Calculates the dividend yield of an entity.

  ## Formula

  dividends / current_price

  ## Required

  * `dividends` - The dividends of the entity.
  * `current_price` - The current price of the entity.

  ## Examples

  iex> FinancialFormulas.dividend_yield(100, 200)
  0.5
  """
  def dividend_yield(dividends, current_price)
      when current_price != 0,
      do: dividends / current_price

  @doc """
  Calculates the divdends per share of an entity.

  ## Formula

  dividends / shares

  ## Required

  * `dividends` - The dividends of the entity.
  * `shares` - The shares of the entity.

  ## Examples

  iex> FinancialFormulas.dividends_per_share(100, 200)
  0.5
  """
  def dividends_per_share(dividends, shares)
      when shares != 0,
      do: dividends / shares

  @doc """
  Calculates the doubling time of an investment.

  ## Formula

  log(2) / log(1 + rate_of_returns)

  ## Required

  * `rate_of_returns` - The rate of returns of the investment.

  ## Examples

  iex> FinancialFormulas.doubling_time(0.1)
  7.272540897341713
  """
  def doubling_time(rate_of_returns), do: :math.log(2) / :math.log(1 + rate_of_returns)

  @doc """
  Calculates the doubling time of an investment with continuous compounding.

  ## Formula

  log(2) / rate_of_returns

  ## Required

  * `rate_of_returns` - The rate of returns of the investment.

  ## Examples

  iex> FinancialFormulas.doubling_time_continuous_compounding(0.1)
  6.931471805599452
  """
  def doubling_time_continuous_compounding(rate_of_returns)
      when rate_of_returns != 0,
      do: :math.log(2) / rate_of_returns

  @doc """
  Calculates the doubling time of an investment with simple interest.

  ## Formula

  1 / rate_of_returns

  ## Required

  * `rate_of_returns` - The rate of returns of the investment.

  ## Examples

  iex> FinancialFormulas.doubling_time_simple(0.1)
  10.0
  """
  def doubling_time_simple(rate_of_returns)
      when rate_of_returns != 0,
      do: 1 / rate_of_returns

  @doc """
  Calculates the earnings per share of an entity.

  ## Formula

  net_income / average_shares

  ## Required

  * `net_income` - The net income of the entity.
  * `average_shares` - The average shares of the entity.

  ## Examples

  iex> FinancialFormulas.earnings_per_share(100, 200)
  0.5
  """
  def earnings_per_share(net_income, average_shares)
      when average_shares != 0,
      do: net_income / average_shares

  @doc """
  Calculates the ebit of an entity.

  ## Formula

  sales_revenue - cost_of_goods_sold - operating_expenses

  ## Required

  * `sales_revenue` - The sales/revenue of the entity.
  * `cost_of_goods_sold` - The cost of goods sold of the entity.
  * `operating_expenses` - The operating expenses of the entity.

  ## Examples

  iex> FinancialFormulas.ebit(100, 200, 300)
  -400
  """
  def ebit(sales_revenue, cost_of_goods_sold, operating_expenses),
    do: sales_revenue - cost_of_goods_sold - operating_expenses

  @doc """
  Calculates the ebitda of an entity.

  ## Formula

  sales_revenue - cost_of_goods_sold - operating_expenses - depreciation_and_amortization

  ## Required

  * `sales_revenue` - The sales/revenue of the entity.
  * `cost_of_goods_sold` - The cost of goods sold of the entity.
  * `operating_expenses` - The operating expenses of the entity.
  * `depreciation_and_amortization` - The depreciation and amortization of the entity.

  ## Examples

  iex> FinancialFormulas.ebitda(100, 200, 300, 400)
  -800
  """
  def ebitda(
        sales_revenue,
        cost_of_goods_sold,
        operating_expenses,
        depreciation_and_amortization
      ),
      do: sales_revenue - cost_of_goods_sold - operating_expenses - depreciation_and_amortization

  @doc """
  Calculates the equity multiplier of an entity.

  ## Formula

  total_assets / total_equity

  ## Required

  * `total_assets` - The total assets of the entity.
  * `total_equity` - The total equity of the entity.

  ## Examples

  iex> FinancialFormulas.equity_multiplier(100, 200)
  0.5
  """
  def equity_multiplier(total_assets, total_equity)
      when total_equity != 0,
      do: total_assets / total_equity

  @doc """
  Calculates the estimated earnings of an entity.

  ## Formula

  forcasted_sales - forcasted_expenses

  ## Required

  * `forcasted_sales` - The forcasted sales of the entity.
  * `forcasted_expenses` - The forcasted expenses of the entity.

  ## Examples

  iex> FinancialFormulas.estimated_earnings(100, 200)
  -100
  """
  def estimated_earnings(forcasted_sales, forcasted_expenses),
    do: forcasted_sales - forcasted_expenses

  @doc """
  Calculates the free cash flow to equity of an entity.

  ## Formula

  net_income + depreciation_and_amortization - capital_expenditures - change_in_working_capital + net_borrowing

  ## Required

  * `net_income` - The net income of the entity.
  * `depreciation_and_amortization` - The depreciation and amortization of the entity.
  * `capital_expenditures` - The capital expenditures of the entity.
  * `change_in_working_capital` - The change in working capital of the entity.
  * `net_borrowing` - The net borrowing of the entity.

  ## Examples

  iex> FinancialFormulas.free_cash_flow_to_equity(100, 200, 300, 400, 500)
  100
  """
  def free_cash_flow_to_equity(
        net_income,
        depreciation_and_amortization,
        capital_expenditures,
        change_in_working_capital,
        net_borrowing
      ),
      do:
        net_income + depreciation_and_amortization - capital_expenditures -
          change_in_working_capital + net_borrowing

  @doc """
  Calculates the free cash flow to firm of an entity.

  ## Formula

  ebit * (1 - tax_rate) + depreciation_and_amortization - capital_expenditures - change_in_working_capital

  ## Required

  * `ebit` - The earnings before interest and taxes of the entity.
  * `tax_rate` - The tax rate of the entity.
  * `depreciation_and_amortization` - The depreciation and amortization of the entity.
  * `capital_expenditures` - The capital expenditures of the entity.
  * `change_in_working_capital` - The change in working capital of the entity.

  ## Examples

  iex> FinancialFormulas.free_cash_flow_to_firm(100, 200, 300, 400, 500)
  -20500
  """
  def free_cash_flow_to_firm(
        ebit,
        tax_rate,
        depreciation_and_amortization,
        capital_expenditures,
        change_in_working_capital
      ),
      do:
        ebit * (1 - tax_rate) + depreciation_and_amortization - capital_expenditures -
          change_in_working_capital

  @doc """
  Calculates the future value of an investment.

  ## Formula

  initial_cash_flow * (1 + rate_of_returns) ^ number_of_periods

  ## Required

  * `initial_cash_flow` - The initial cash flow of the investment.
  * `rate_of_returns` - The rate of returns of the investment.
  * `number_of_periods` - The number of periods.

  ## Examples

  iex> FinancialFormulas.future_value(100, 0.1, 2)
  121.00000000000001
  """
  def future_value(initial_cash_flow, rate_of_returns, number_of_periods),
    do: initial_cash_flow * :math.pow(1 + rate_of_returns, number_of_periods)

  @doc """
  Calculates the future value of an investment with continuous compounding.

  ## Formula

  present_value * e ^ (rate_of_returns * number_of_periods)

  ## Required

  * `present_value` - The present value of the investment.
  * `rate_of_returns` - The rate of returns of the investment.
  * `number_of_periods` - The number of periods.

  ## Examples

  iex> FinancialFormulas.future_value_continuous_compounding(100, 0.1, 2)
  122.14027581601698
  """
  def future_value_continuous_compounding(present_value, rate_of_returns, number_of_periods),
    do: present_value * :math.exp(rate_of_returns * number_of_periods)

  @doc """
  Calculates the future value of an annuity.

  ## Formula

  payment * ((1 + interest_rate) ^ number_of_payments - 1) / interest_rate

  ## Required

  * `payment` - The amount of each payment.
  * `interest_rate` - The interest rate of the investment.
  * `number_of_payments` - The number of payments.

  ## Examples

  iex> FinancialFormulas.future_value_of_annuity(100, 0.1, 2)
  210.0000000000002
  """
  def future_value_of_annuity(payment, interest_rate, number_of_payments)
      when interest_rate != 0,
      do: payment * ((:math.pow(1 + interest_rate, number_of_payments) - 1) / interest_rate)

  @doc """
  Calculates the geometric mean of a set of returns.

  ## Formula

  (1 + rate_of_returns) ^ (1 / n) - 1

  ## Required

  * `rate_of_returns` - The rate of returns of the investment.

  ## Examples

  iex> FinancialFormulas.geometric_mean([0.1, 0.2, 0.3])
  0.1972157672583763
  """
  def geometric_mean(rate_of_returns) do
    n = Enum.count(rate_of_returns)

    rate_of_returns
    |> Enum.map(&:math.pow(1 + &1, 1.0 / n))
    |> Enum.reduce(&(&1 * &2))
    |> Kernel.-(1)
  end

  @doc """
  Calculates the gross profit margin of an entity.

  ## Formula

  (sales_revenue - cost_of_goods_sold) / sales_revenue

  ## Required

  * `sales_revenue` - The sales/revenue of the entity.
  * `cost_of_goods_sold` - The cost of goods sold of the entity.

  ## Examples

  iex> FinancialFormulas.gross_profit_margin(100, 200)
  -1.0
  """
  def gross_profit_margin(sales_revenue, cost_of_goods_sold)
      when sales_revenue != 0,
      do: (sales_revenue - cost_of_goods_sold) / sales_revenue

  @doc """
  Calculates the interest coverage ratio of an entity.

  ## Formula

  ebit / interest_expense

  ## Required

  * `ebit` - The earnings before interest and taxes of the entity.
  * `interest_expense` - The interest expense of the entity.

  ## Examples

  iex> FinancialFormulas.interest_coverage_ratio(100, 200)
  0.5
  """
  def interest_coverage_ratio(ebit, interest_expense)
      when interest_expense != 0,
      do: ebit / interest_expense

  @doc """
  Calculates the inventory turnover ratio of an entity.

  ## Formula

  cost_of_goods_sold / average_inventory

  ## Required

  * `cost_of_goods_sold` - The cost of goods sold of the entity.
  * `average_inventory` - The average inventory of the entity.

  ## Examples

  iex> FinancialFormulas.inventory_turnover_ratio(100, 200)
  0.5
  """
  def inventory_turnover_ratio(cost_of_goods_sold, average_inventory)
      when average_inventory != 0,
      do: cost_of_goods_sold / average_inventory

  @doc """
  Calculates the loan to deposit ratio of an entity.

  ## Formula

  total_loans / total_deposits

  ## Required

  * `total_loans` - The total loans of the entity.
  * `total_deposits` - The total deposits of the entity.

  ## Examples

  iex> FinancialFormulas.loan_to_deposit_ratio(100, 200)
  0.5
  """
  def loan_to_deposit_ratio(total_loans, total_deposits)
      when total_deposits != 0,
      do: total_loans / total_deposits

  @doc """
  Calculates the margin of safety of an investment.

  ## Formula

  (intrinsic_value - current_price) / intrinsic_value

  ## Required

  * `current_price` - The current price of the investment.
  * `intrinsic_value` - The intrinsic value of the investment.

  ## Examples

  iex> FinancialFormulas.margin_of_safty(100, 200)
  0.5
  """
  def margin_of_safty(current_price, intrinsic_value)
      when intrinsic_value != 0,
      do: (intrinsic_value - current_price) / intrinsic_value

  @doc """
  Calculates the market capitalization of an entity.

  ## Formula

  price_per_share * outstanding_shares

  ## Required

  * `price_per_share` - The price per share of the entity.
  * `outstanding_shares` - The outstanding shares of the entity.

  ## Examples

  iex> FinancialFormulas.market_capitalization(100, 200)
  20000
  """
  def market_capitalization(price_per_share, outstanding_shares),
    do: price_per_share * outstanding_shares

  @doc """
  Calculates the market to book ratio of an entity.

  ## Formula

  market_price_per_share / book_value_per_share

  ## Required

  * `market_price_per_share` - The market price per share of the entity.
  * `book_value_per_share` - The book value per share of the entity.

  ## Examples

  iex> FinancialFormulas.market_to_book_ratio(100, 200)
  0.5
  """
  def market_to_book_ratio(market_price_per_share, book_value_per_share)
      when book_value_per_share != 0,
      do: market_price_per_share / book_value_per_share

  @doc """
  Calculates the net asset value of an entity.

  ## Formula

  (assets - liabilities) / shares

  ## Required

  * `assets` - The assets of the entity.
  * `liabilities` - The liabilities of the entity.
  * `shares` - The shares of the entity.

  ## Examples

  iex> FinancialFormulas.net_asset_value(100, 200, 300)
  -0.3333333333333333
  """
  def net_asset_value(assets, liabilities, shares)
      when shares != 0,
      do: (assets - liabilities) / shares

  @doc """
  Calculates the net intrest income of an entity.

  ## Formula

  intrest_income - intrest_expense

  ## Required

  * `intrest_income` - The intrest income of the entity.
  * `intrest_expense` - The intrest expense of the entity.

  ## Examples

  iex> FinancialFormulas.net_intrest_income(100, 200)
  -100
  """
  def net_intrest_income(intrest_income, intrest_expense), do: intrest_income - intrest_expense

  @doc """
  Calculates the net intrest margin of an entity.

  ## Formula

  net_intrest_income / average_earning_assets

  ## Required

  * `net_intrest_income` - The net intrest income of the entity.
  * `average_earning_assets` - The average earning assets of the entity.

  ## Examples

  iex> FinancialFormulas.net_intrest_margin(100, 200)
  0.5
  """
  def net_intrest_margin(net_intrest_income, average_earning_assets)
      when average_earning_assets != 0,
      do: net_intrest_income / average_earning_assets

  @doc """
  Calculates the net intrest spread of an entity.

  ## Formula

  intrest_income_rate - intrest_expense_rate

  ## Required

  * `intrest_income_rate` - The intrest income rate of the entity.
  * `intrest_expense_rate` - The intrest expense rate of the entity.

  ## Examples

  iex> FinancialFormulas.net_intrest_spread(100, 200)
  -100
  """
  def net_intrest_spread(intrest_income_rate, intrest_expense_rate),
    do: intrest_income_rate - intrest_expense_rate

  @doc """
  Calculates the net present value of an investment.

  ## Formula

  sum(cash_flows / (1 + discount_rate) ^ index) - initial_investment

  ## Required

  * `initial_investment` - The initial investment of the entity.
  * `cash_flows` - The cash flows of the entity.
  * `discount_rate` - The discount rate of the entity.

  ## Examples

  iex> FinancialFormulas.net_present_value(100, [100, 200, 300], 0.5)
  144.44444444444443
  """
  def net_present_value(initial_investment, cash_flows, discount_rate) do
    discounted_cash_flows =
      Enum.with_index(cash_flows)
      |> Enum.map(fn {cash_flow, index} ->
        cash_flow / :math.pow(1 + discount_rate, index + 1)
      end)

    Enum.sum(discounted_cash_flows) - initial_investment
  end

  @doc """
  Calculates the net profit margin of an entity.

  ## Formula

  net_income / sales_revenue

  ## Required

  * `net_income` - The net income of the entity.
  * `sales_revenue` - The sales/revenue of the entity.

  ## Examples

  iex> FinancialFormulas.net_profit_margin(100, 200)
  0.5
  """
  def net_profit_margin(net_income, sales_revenue)
      when sales_revenue != 0,
      do: net_income / sales_revenue

  @doc """
  Calculates the net working capital of an entity.

  ## Formula

  current_assets - current_liabilities

  ## Required

  * `current_assets` - The current assets of the entity.
  * `current_liabilities` - The current liabilities of the entity.

  ## Examples

  iex> FinancialFormulas.net_working_capital(100, 200)
  -100
  """
  def net_working_capital(current_assets, current_liabilities),
    do: current_assets - current_liabilities

  @doc """
  Calculates the operating cycle of an entity.

  ## Formula

  days_inventory_outstanding + days_sales_outstanding

  ## Required

  * `days_inventory_outstanding` - The days inventory outstanding of the entity.
  * `days_sales_outstanding` - The days sales outstanding of the entity.

  ## Examples

  iex> FinancialFormulas.operating_cycle(100, 200)
  300
  """
  def operating_cycle(days_inventory_outstanding, days_sales_outstanding),
    do: days_inventory_outstanding + days_sales_outstanding

  @doc """
  Calculates the operating margin of an entity.

  ## Formula

  operating_income / sales_revenue

  ## Required

  * `operating_income` - The operating income of the entity.
  * `sales_revenue` - The sales/revenue of the entity.

  ## Examples

  iex> FinancialFormulas.operating_margin(100, 200)
  0.5
  """
  def operating_margin(operating_income, sales_revenue)
      when sales_revenue != 0,
      do: operating_income / sales_revenue

  @doc """
  Calculates the payables turnover ratio of an entity.

  ## Formula

  cost_of_goods_sold / average_accounts_payable

  ## Required

  * `cost_of_goods_sold` - The cost of goods sold of the entity.
  * `average_accounts_payable` - The average accounts payable of the entity.

  ## Examples

  iex> FinancialFormulas.payables_turnover_ratio(100, 200)
  0.5
  """
  def payables_turnover_ratio(cost_of_goods_sold, average_accounts_payable)
      when average_accounts_payable != 0,
      do: cost_of_goods_sold / average_accounts_payable

  @doc """
  Calculates the payback period of an investment.

  ## Formula

  initial_investment / periodic_cash_flows

  ## Required

  * `initial_investment` - The initial investment of the entity.
  * `periodic_cash_flows` - The periodic cash flows of the entity.

  ## Examples

  iex> FinancialFormulas.payback_period(100, 200)
  0.5
  """
  def payback_period(initial_investment, periodic_cash_flows)
      when periodic_cash_flows != 0,
      do: initial_investment / periodic_cash_flows

  @doc """
  Calculates the perpetuity yield.

  ## Formula

  payment / present_value

  ## Required

  * `payment` - The payment of the entity.
  * `present_value` - The present value of the entity.

  ## Examples

  iex> FinancialFormulas.perpetuity_yield(100, 200)
  0.5
  """
  def perpetuity_yield(payment, present_value)
      when present_value != 0,
      do: payment / present_value

  @doc """
  Calculates the preferred stock value.

  ## Formula

  dividend / discount_rate

  ## Required

  * `dividend` - The dividend of the entity.
  * `discount_rate` - The discount rate of the entity.

  ## Examples

  iex> FinancialFormulas.preferred_stock_value(100, 200)
  0.5
  """
  def preferred_stock_value(dividend, discount_rate)
      when discount_rate != 0,
      do: dividend / discount_rate

  @doc """
  Calculates the present value.

  ## Formula

  cash_flow / (1 + rate_of_return) ^ number_of_periods

  ## Required

  * `future_value` - The future value of the entity.
  * `rate_of_return` - The rate of return of the entity.
  * `number_of_periods` - The number of periods of the entity.

  ## Examples

  iex> FinancialFormulas.present_value(100, 200, 1)
  0.4975124378109453
  """
  def present_value(future_value, rate_of_return, number_of_periods),
    do: future_value / :math.pow(1 + rate_of_return, number_of_periods)

  @doc """
  Calculates prevent value with continuous compounding.

  ## Formula

  cash_flow / e ^ (rate * time)

  ## Required

  * `future_value` - The future value of the entity.
  * `rate_of_return` - The rate of return of the entity.
  * `time` - The number of periods of the entity.

  ## Examples

  iex> FinancialFormulas.present_value_continuous_compounding(1, 2, 1)
  0.1353352832366127
  """
  def present_value_continuous_compounding(future_value, rate_of_return, time)
      when rate_of_return * time != 0,
      do: future_value / :math.exp(rate_of_return * time)

  @doc """
  Calculates the present value of perpetuity.

  ## Formula

  coupon_per_period / discount_rate

  ## Required

  * `coupon_per_period` - The coupon per period of the entity.
  * `discount_rate` - The discount rate of the entity.

  ## Examples

  iex> FinancialFormulas.present_value_of_perpetuity(100, 200)
  0.5
  """
  def present_value_of_perpetuity(coupon_per_period, discount_rate)
      when discount_rate != 0,
      do: coupon_per_period / discount_rate

  @doc """
  Calculates the price to book value.

  ## Formula

  price_per_share / book_value_per_share

  ## Required

  * `price_per_share` - The price per share of the entity.
  * `book_value_per_share` - The book value per share of the entity.

  ## Examples

  iex> FinancialFormulas.price_to_book_value(100, 200)
  0.5
  """
  def price_to_book_value(price_per_share, book_value_per_share)
      when book_value_per_share != 0,
      do: price_per_share / book_value_per_share

  @doc """
  Calculates the price to cash flow.

  ## Formula

  market_capitalization / cash_flow

  ## Required

  * `market_capitalization` - The market capitalization of the entity.
  * `cash_flow` - The cash flow of the entity.

  ## Examples

  iex> FinancialFormulas.price_to_cash_flow(100, 200)
  0.5
  """
  def price_to_cash_flow(market_capitalization, operating_cash_flow)
      when operating_cash_flow != 0,
      do: market_capitalization / operating_cash_flow

  @doc """
  Calculates the price to dividend ratio.

  ## Formula

  price_per_share / dividend_per_share

  ## Required

  * `price_per_share` - The price per share of the entity.
  * `dividend_per_share` - The dividend per share of the entity.

  ## Examples

  iex> FinancialFormulas.price_to_dividend_ratio(100, 200)
  0.5
  """
  def price_to_dividend_ratio(price_per_share, dividend_per_share)
      when dividend_per_share != 0,
      do: price_per_share / dividend_per_share

  @doc """
  Calculates the price to earnings ratio.

  ## Formula

  price_per_share / earnings_per_share

  ## Required

  * `price_per_share` - The price per share of the entity.
  * `earnings_per_share` - The earnings per share of the entity.

  ## Examples

  iex> FinancialFormulas.price_to_earnings_ratio(100, 200)
  0.5
  """
  def price_to_earnings_ratio(price_per_share, earnings_per_share)
      when earnings_per_share != 0,
      do: price_per_share / earnings_per_share

  @doc """
  Calculates the price to sales ratio.

  ## Formula

  price_per_share / sales_per_share

  ## Required

  * `price_per_share` - The price per share of the entity.
  * `sales_per_share` - The sales per share of the entity.

  ## Examples

  iex> FinancialFormulas.price_to_sales_ratio(100, 200)
  0.5
  """
  def price_to_sales_ratio(price_per_share, sales_per_share)
      when sales_per_share != 0,
      do: price_per_share / sales_per_share

  @doc """
  Calculates the profitability index.

  ## Formula

  present_value_of_future_cash_flows / initial_investment

  ## Required

  * `present_value_of_future_cash_flows` - The present value of future cash flows of the entity.
  * `initial_investment` - The initial investment of the entity.

  ## Examples

  iex> FinancialFormulas.profitability_index(100, 200)
  0.5
  """
  def profitability_index(present_value_of_future_cash_flows, initial_investment)
      when initial_investment != 0,
      do: present_value_of_future_cash_flows / initial_investment

  @doc """
  Calculates the quick ratio.

  ## Formula

  quick_assets / current_liabilities

  ## Required

  * `quick_assets` - The quick assets of the entity.
  * `current_liabilities` - The current liabilities of the entity.

  ## Examples

  iex> FinancialFormulas.quick_ratio(100, 200)
  0.5
  """
  def quick_ratio(quick_assets, current_liabilities)
      when current_liabilities != 0,
      do: quick_assets / current_liabilities

  @doc """
  Calculates the quick ratio.

  ## Formula

  (current_assets - inventory) / current_liabilities

  ## Required

  * `current_assets` - The current assets of the entity.
  * `inventory` - The inventory of the entity.
  * `current_liabilities` - The current liabilities of the entity.

  ## Examples

  iex> FinancialFormulas.quick_ratio(100, 200, 300)
  -0.3333333333333333
  """
  def quick_ratio(current_assets, inventory, current_liabilities)
      when current_liabilities != 0,
      do: (current_assets - inventory) / current_liabilities

  @doc """
  Calculates the real GDP.

  ## Formula

  nominal_gdp / gdp_deflator

  ## Required

  * `nominal_gdp` - The nominal GDP.
  * `gdp_deflator` - The GDP deflator.

  ## Examples

  iex> FinancialFormulas.real_gdp(100, 200)
  0.5
  """
  def real_gdp(nominal_gdp, gdp_deflator)
      when gdp_deflator != 0,
      do: nominal_gdp / gdp_deflator

  @doc """
  Calculates the receivables turnover ratio of an entity.

  ## Formula

  net_credit_sales / average_accounts_receivable

  ## Required

  * `net_credit_sales` - The net credit sales of the entity.
  * `average_accounts_receivable` - The average accounts receivable of the entity.

  ## Examples

  iex> FinancialFormulas.receivables_turnover_ratio(100, 200)
  0.5
  """
  def receivables_turnover_ratio(net_credit_sales, average_accounts_receivable)
      when average_accounts_receivable != 0,
      do: net_credit_sales / average_accounts_receivable

  @doc """
  Calculates the retained earnings of an entity.

  ## Formula

  net_income - dividends

  ## Required

  * `net_income` - The net income of the entity.
  * `dividends` - The dividends of the entity.

  ## Examples

  iex> FinancialFormulas.retained_earnings(100, 200)
  -100
  """
  def retained_earnings(net_income, dividends), do: net_income - dividends

  @doc """
  Calculates the retention ratio.

  ## Formula

  (net_income - dividends) / net_income

  ## Required

  * `net_income` - The net income of the entity.
  * `dividends` - The dividends of the entity.

  ## Examples

  iex> FinancialFormulas.retention_ratio(100, 200)
  -1.0
  """
  def retention_ratio(net_income, dividends)
      when net_income != 0,
      do: (net_income - dividends) / net_income

  @doc """
  Calculates the return on assets.

  ## Formula

  net_income / average_total_assets

  ## Required

  * `net_income` - The net income of the entity.
  * `average_total_assets` - The average total assets of the entity.

  ## Examples

  iex> FinancialFormulas.return_on_assets(100, 200)
  0.5
  """
  def return_on_assets(net_income, average_total_assets)
      when average_total_assets != 0,
      do: net_income / average_total_assets

  @doc """
  Calculates the return on equity.

  ## Formula

  net_income / average_shareholder_equity

  ## Required

  * `net_income` - The net income of the entity.
  * `average_shareholder_equity` - The average shareholder equity of the entity.

  ## Examples

  iex> FinancialFormulas.return_on_equity(100, 200)
  0.5
  """
  def return_on_equity(net_income, average_shareholder_equity)
      when average_shareholder_equity != 0,
      do: net_income / average_shareholder_equity

  @doc """
  Calculates the return on investment.

  ## Formula

  (earnings - initial_investment) / initial_investment

  ## Required

  * `initial_investment` - The initial investment of the entity.
  * `earnings` - The earnings of the entity.

  ## Examples

  iex> FinancialFormulas.return_on_investment(100, 200)
  1.0
  """
  def return_on_investment(initial_investment, earnings)
      when initial_investment != 0,
      do: (earnings - initial_investment) / initial_investment

  @doc """
  Calculates the risk premium.

  ## Formula

  asset_or_investment_return - risk_free_return

  ## Required

  * `asset_or_investment_return` - The asset or investment return.
  * `risk_free_return` - The risk free return.

  ## Examples

  iex> FinancialFormulas.risk_premium(100, 200)
  -100
  """
  def risk_premium(asset_or_investment_return, risk_free_return),
    do: asset_or_investment_return - risk_free_return

  @doc """
  Calculates the rule of 72.

  ## Formula

  72 / rate_of_return

  ## Required

  * `rate_of_return` - The rate of return as a whole number.

  ## Examples

  iex> FinancialFormulas.rule_of_72(100)
  0.72
  """
  def rule_of_72(rate_of_return)
      when rate_of_return != 0,
      do: 72 / rate_of_return

  @doc """
  Calculates the simple interest.

  ## Formula

  principal * interest_rate * time

  ## Required

  * `principal` - The principal amount.
  * `interest_rate` - The interest rate.
  * `time` - The time.

  ## Examples

  iex> FinancialFormulas.simple_interest(100, 200, 300)
  6000000
  """
  def simple_interest(principal, interest_rate, time), do: principal * interest_rate * time

  @doc """
  Calculates the straight line depreciation.

  ## Formula

  (initial_value - salvage_value) / useful_life

  ## Required

  * `initial_value` - The initial value.
  * `salvage_value` - The salvage value.
  * `useful_life` - The useful life.

  ## Examples

  iex> FinancialFormulas.straight_line_depreciation(100, 200, 300)
  -0.3333333333333333
  """
  def straight_line_depreciation(initial_value, salvage_value, useful_life)
      when useful_life != 0,
      do: (initial_value - salvage_value) / useful_life

  @doc """
  Calculates the tax equivalent yield.

  ## Formula

  tax_free_yield / (1 - tax_rate)

  ## Required

  * `tax_free_yield` - The tax free yield.
  * `tax_rate` - The tax rate.

  ## Examples

  iex> FinancialFormulas.tax_equivalent_yield(100, 200)
  -0.5025125628140703
  """
  def tax_equivalent_yield(tax_free_yield, tax_rate)
      when tax_rate != 1,
      do: tax_free_yield / (1 - tax_rate)

  @doc """
  Calculates the times interest earned ratio.

  ## Formula

  ebit / interest_expense

  ## Required

  * `ebit` - The earnings before interest and taxes of the entity.
  * `interest_expense` - The interest expense of the entity.

  ## Examples

  iex> FinancialFormulas.times_interest_earned_ratio(100, 200)
  0.5
  """
  def times_interest_earned_ratio(ebit, interest_expense)
      when interest_expense != 0,
      do: ebit / interest_expense

  @doc """
  Calculates the total stock return.

  ## Formula

  (ending_stock_price - initial_stock_price + dividends) / initial_stock_price

  ## Required

  * `initial_stock_price` - The initial stock price.
  * `ending_stock_price` - The ending stock price.
  * `dividends` - The dividends.

  ## Examples

  iex> FinancialFormulas.total_stock_return(100, 200, 50)
  1.5
  """
  def total_stock_return(initial_stock_price, ending_stock_price, dividends)
      when initial_stock_price != 0,
      do: (ending_stock_price - initial_stock_price + dividends) / initial_stock_price

  @doc """
  Calculates the weighted average.

  ## Formula

  (weight1 * value1) + (weight2 * value2) + ... + (weightN * valueN)

  ## Required

  * `list` - The list of weights and values.

  ## Examples

  iex> FinancialFormulas.weighted_average([{0.5, 100}, {0.5, 200}])
  150.0
  """
  def weighted_average(list) do
    list
    |> Enum.map(fn {weight, value} -> weight * value end)
    |> Enum.sum()
  end

  @doc """
  Calculates the year over year growth rate.

  ## Formula

  (current_year - previous_year) / previous_year

  ## Required

  * `current_year` - The current year value
  * `previous_year` - The previous year value

  ## Examples

  iex> FinancialFormulas.year_over_year(100, 200)
  -0.5
  """
  def year_over_year(current_year, previous_year)
      when previous_year != 0,
      do: (current_year - previous_year) / previous_year

  @doc """
  Transforms a number to a percentage.

  ## Required

  * `number` - The number to transform.
  """
  def to_percentage(number), do: number * 100
end
