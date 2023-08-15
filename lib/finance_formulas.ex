defmodule FinanceFormulas do
  @doc """
  Calculates the annual percentage yield (APY) of an investment.

  The annual percentage yield is the the rate of interest that is earned when taking into consideration the effect of compounding.

  ## Formula

  (1 + interest_rate / number_of_times_compounded) ^ number_of_times_compounded - 1

  ## Required

  * `annual_interest_rate` - The annual interest rate of the investment.
  * `number_of_times_compounded` - The number of times the interest is compounded per year.
  """
  def annual_percentage_yield(annual_interest_rate, number_of_times_compounded) do
    :math.pow(1 + annual_interest_rate / number_of_times_compounded, number_of_times_compounded) -
      1
  end

  @doc """
  Calculates the asset to sales ratio of an entity.

  ## Formula

  total_asset / total_sales

  ## Required

  * `total_assets` - The total assets of the entity.
  * `sales_revenue` - The sales/revenue of the entity.
  """
  def asset_to_sales_ratio(total_assets, sales_revenue), do: total_assets / sales_revenue

  @doc """
  Calculates the asset turnover ratio of an entity.

  ## Formula

  total_sales / total_asset

  ## Required

  * `sales_revenue` - The sales/revenue of the entity.
  * `total_asset` - The total assets of the entity.
  """
  def asset_turnover_ratio(sales_revenue, total_assets), do: sales_revenue / total_assets

  @doc """
  Calculates the average collection period of an entity.

  ## Formula

  365 / receivables_turnover_ratio

  ## Required

  * `receivables_turnover_ratio` - The receivables turnover ratio of the entity.
  """
  def average_collection_period(receivables_turnover_ratio), do: 365 / receivables_turnover_ratio

  @doc """
  Calculates the average inventory of an entity.

  ## Formula

  (ending_inventory + beginning_inventory) / 2

  ## Required

  * `ending_inventory` - The ending inventory of the entity.
  * `beginning_inventory` - The beginning inventory of the entity.
  """
  def average_inventory(ending_inventory, beginning_inventory),
    do: (ending_inventory + beginning_inventory) / 2

  @doc """
  Calculates the average payment period of an entity.

  ## Formula

  average_accounts_payable / (credit_purchases / days_in_period)

  ## Required

  * `average_accounts_payable` - The average accounts payable of the entity.
  * `credit_purchases` - The credit purchases of the entity.
  * `days_in_period` - The number of days in the period.
  """
  def average_payment_period(average_accounts_payable, credit_purchases, days_in_period),
    do: average_accounts_payable / (credit_purchases / days_in_period)

  @doc """
  Calculates the bid ask spread of a security.

  ## Formula

  ask_price - bid_price

  ## Required

  * `ask_price` - The ask price of the security.
  * `bid_price` - The bid price of the security.
  """
  def bid_ask_spread(ask_price, bid_price), do: ask_price - bid_price

  @doc """
  Calculates the bond equivalent yield of a bond.

  ## Formula

  (face_value - bond_price) / bond_price * (365 / days)

  ## Required

  * `face_value` - The face value of the bond.
  * `bond_price` - The price of the bond.

  ## Optional

  * `days_to_maturity` - The number of days until the bond matures. Defaults to 365.
  """
  def bond_equivalent_yield(face_value, bond_price, days_to_maturity \\ 365),
    do: (face_value - bond_price) / bond_price * (365 / days_to_maturity)

  @doc """
  Calculates the book value per share of an entity.

  ## Formula

  total_equity / number_of_shares

  ## Required

  * `total_common_equity` - The total common equity of the entity.
  * `number_of_common_shares` - The number of common shares of the entity.
  """
  def book_value_per_share(total_common_equity, number_of_common_shares),
    do: total_common_equity / number_of_common_shares

  @doc """
  Calculates the capital asset pricing model (CAPM).

  ## Formula

  risk_free_rate + beta * (expected_market_return - risk_free_rate)

  ## Required

  * `risk_free_rate` - The risk free rate.
  * `beta` - The beta of the investment.
  * `return_on_the_market` - The return on the market.
  """
  def capital_asset_pricing_model(risk_free_rate, beta, return_on_the_market),
    do: risk_free_rate + beta * (return_on_the_market - risk_free_rate)

  @doc """
  Calculates the capital gains yield of an investment.

  ## Formula

  (final_price - initial_price) / initial_price

  ## Required

  * `initial_price` - The initial price of the investment.
  * `final_price` - The final price of the investment.
  """
  def capital_gains_yield(initial_price, final_price),
    do: (final_price - initial_price) / initial_price

  @doc """
  Calculates the cash conversion cycle of an entity.

  ## Formula

  days_inventory_outstanding + days_sales_outstanding - days_payable_outstanding

  ## Required

  * `days_inventory_outstanding` - The days inventory outstanding of the entity.
  * `days_sales_outstanding` - The days sales outstanding of the entity.
  * `days_payable_outstanding` - The days payable outstanding of the entity.
  """
  def cash_conversion_cycle(
        days_inventory_outstanding,
        days_sales_outstanding,
        days_payable_outstanding
      ),
      do: days_inventory_outstanding + days_sales_outstanding - days_payable_outstanding

  @doc """
  Calculates compound interest.

  ## Formula

  principal * ((1 + rate_per_period) ^ number_of_periods - 1)

  ## Required

  * `principal` - The principal amount.
  * `rate_per_period` - The interest rate per period.

  ## Optional

  * `number_of_periods` - The number of periods. Defaults to 1.
  """
  def compound_interest(principal, rate_per_period, number_of_periods \\ 1),
    do: principal * (:math.pow(1 + rate_per_period, number_of_periods) - 1)

  @doc """
  Calculates the contribution margin

  ## Formula

  total_sales_revenue - variable_costs

  ## Required

  * `total_sales_revenue` - The total sales revenue
  * `variable_costs` - The variable costs
  """
  def contribution_margin(total_sales_revenue, variable_costs),
    do: total_sales_revenue - variable_costs

  @doc """
  Calculates the contribution margin ratio

  ## Formula

  contribution_margin / total_sales_revenue

  ## Required

  * `contribution_margin` - The contribution margin
  * `total_sales_revenue` - The total sales revenue
  """
  def contribution_margin_ratio(contribution_margin, total_sales_revenue),
    do: contribution_margin / total_sales_revenue

  @doc """
  Calculates the continuous compounding of an investment.

  ## Formula

  principal * e ^ (rate * time)

  ## Required

  * `principal` - The principal amount.
  * `rate` - The interest rate.
  * `time` - The time.
  """
  def continuous_compounding(principal, rate, time),
    do: principal * :math.exp(rate * time)

  @doc """
  Calculates the costs of goods sold of an entity.

  ## Formula

  beginning_inventory + purchases - ending_inventory

  ## Required

  * `beginning_inventory` - The beginning inventory.
  * `purchases` - The purchases.
  * `ending_inventory` - The ending inventory.
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
  """
  def cost_to_income_ratio(operational_costs, operational_income),
    do: operational_costs / operational_income

  @doc """
  Calculates the current ratio of an entity.

  ## Formula

  current_assets / current_liabilities

  ## Required

  * `current_assets` - The current assets of the entity.
  * `current_liabilities` - The current liabilities of the entity.
  """
  def current_ratio(current_assets, current_liabilities), do: current_assets / current_liabilities

  @doc """
  Calculates the current yield of a bond.

  ## Formula

  annual_income / current_price

  ## Required

  * `annual_coupons` - The annual coupons of the bond.
  * `current_price` - The current price of the bond.
  """
  def current_yield(annual_coupons, current_price), do: annual_coupons / current_price

  @doc """
  Calculates the inventory turnover of an entity.

  ## Formula

  365 / inventory_turnover

  ## Required

  * `inventory_turnover` - The inventory turnover of the entity.
  """
  def days_in_inventory(inventory_turnover), do: 365 / inventory_turnover

  @doc """
  Calculates the days sales of inventory of an entity.

  ## Formula

  average_inventory / cost_of_goods_sold * 365

  ## Required

  * `average_inventory` - The average inventory of the entity.
  * `cost_of_goods_sold` - The cost of goods sold of the entity.
  """
  def days_sales_of_inventory(average_inventory, cost_of_goods_sold),
    do: average_inventory / cost_of_goods_sold * 365

  @doc """
  Calculates the days sales outstanding of an entity.

  ## Formula

  accounts_receivable / total_credit_sales * 365

  ## Required

  * `accounts_receivable` - The accounts receivable of the entity.
  * `total_credit_sales` - The total credit sales of the entity.
  """
  def days_sales_outstanding(accounts_receivable, total_credit_sales),
    do: accounts_receivable / total_credit_sales * 365

  @doc """
  Calculates the days payable outstanding of an entity.

  ## Formula

  accounts_payable / cost_of_goods_sold * 365

  ## Required

  * `accounts_payable` - The accounts payable of the entity.
  * `cost_of_goods_sold` - The cost of goods sold of the entity.
  """
  def days_payable_outstanding(accounts_payable, cost_of_goods_sold),
    do: accounts_payable / cost_of_goods_sold * 365

  @doc """
  Calculates the debt coverage ratio of an entity.

  ## Formula

  net_operating_income / total_debt_service

  ## Required

  * `net_operating_income` - The net operating income of the entity.
  * `total_debt_service` - The total debt service of the entity.
  """
  def debt_coverage_ratio(net_operating_income, total_debt_service),
    do: net_operating_income / total_debt_service

  @doc """
  Calculates the debt ratio of an entity.

  ## Formula

  total_liabilities / total_assets

  ## Required

  * `total_liabilities` - The total liabilities of the entity.
  * `total_assets` - The total assets of the entity.
  """
  def debt_ratio(total_liabilities, total_assets), do: total_liabilities / total_assets

  @doc """
  Calculates the debt to equity ratio of an entity.

  ## Formula

  total_liabilities / total_equity

  ## Required

  * `total_liabilities` - The total liabilities of the entity.
  * `total_equity` - The total equity of the entity.
  """
  def debt_to_equity_ratio(total_liabilities, total_equity), do: total_liabilities / total_equity

  @doc """
  Calculates the debt to income ratio of an entity.

  ## Formula

  debt / income

  ## Required

  * `debt` - The total debt of the entity.
  * `income` - The total income of the entity.
  """
  def debt_to_income_ratio(debt, income), do: debt / income

  @doc """
  Calculates the diluted earnings per share of an entity.

  ## Formula

  net_income / (average_shares + other_convertible_instruments)

  ## Required

  * `net_income` - The net income of the entity.
  * `average_shares` - The average shares of the entity.
  * `other_convertible_instruments` - The other convertible instruments of the entity.
  """
  def diluted_earnings_per_share(net_income, average_shares, other_convertible_instruments \\ 0),
    do: net_income / (average_shares + other_convertible_instruments)

  @doc """
  Calculates the dividend payout ratio of an entity.

  ## Formula

  dividends / net_income

  ## Required

  * `dividends` - The dividends of the entity.
  * `net_income` - The net income of the entity.
  """
  def dividend_payout_ratio(dividends, net_income), do: dividends / net_income

  @doc """
  Calculates the dividend yield of an entity.

  ## Formula

  dividends / current_price

  ## Required

  * `dividends` - The dividends of the entity.
  * `current_price` - The current price of the entity.
  """
  def dividend_yield(dividends, current_price), do: dividends / current_price

  @doc """
  Calculates the divdends per share of an entity.

  ## Formula

  dividends / shares

  ## Required

  * `dividends` - The dividends of the entity.
  * `shares` - The shares of the entity.
  """
  def dividens_per_share(dividends, shares), do: dividends / shares

  @doc """
  Calculates the doubling time of an investment.

  ## Formula

  log(2) / log(1 + rate_of_returns)

  ## Required

  * `rate_of_returns` - The rate of returns of the investment.
  """
  def doubling_time(rate_of_returns), do: :math.log(2) / :math.log(1 + rate_of_returns)

  @doc """
  Calculates the doubling time of an investment with continuous compounding.

  ## Formula

  log(2) / rate_of_returns

  ## Required

  * `rate_of_returns` - The rate of returns of the investment.
  """
  def doubling_time_continuous_compounding(rate_of_returns), do: :math.log(2) / rate_of_returns

  @doc """
  Calculates the doubling time of an investment with simple interest.

  ## Formula

  1 / rate_of_returns

  ## Required

  * `rate_of_returns` - The rate of returns of the investment.
  """
  def doubling_time_simple(rate_of_returns), do: 1 / rate_of_returns

  @doc """
  Calculates the earnings per share of an entity.

  ## Formula

  net_income / average_shares

  ## Required

  * `net_income` - The net income of the entity.
  * `average_shares` - The average shares of the entity.
  """
  def earnings_per_share(net_income, average_shares), do: net_income / average_shares

  @doc """
  Calculates the ebit of an entity.

  ## Formula

  sales_revenue - cost_of_goods_sold - operating_expenses

  ## Required

  * `sales_revenue` - The sales/revenue of the entity.
  * `cost_of_goods_sold` - The cost of goods sold of the entity.
  * `operating_expenses` - The operating expenses of the entity.
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
  """
  def ebida(sales_revenue, cost_of_goods_sold, operating_expenses, depreciation_and_amortization),
    do: sales_revenue - cost_of_goods_sold - operating_expenses - depreciation_and_amortization

  @doc """
  Calculates the equity multiplier of an entity.

  ## Formula

  total_assets / total_equity

  ## Required

  * `total_assets` - The total assets of the entity.
  * `total_equity` - The total equity of the entity.
  """
  def equity_multiplier(total_assets, total_equity), do: total_assets / total_equity

  @doc """
  Calculates the estimated earnings of an entity.

  ## Formula

  forcasted_sales - forcasted_expenses

  ## Required

  * `forcasted_sales` - The forcasted sales of the entity.
  * `forcasted_expenses` - The forcasted expenses of the entity.
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
  """
  def future_value_of_annuity(payment, interest_rate, number_of_payments),
    do: payment * ((:math.pow(1 + interest_rate, number_of_payments) - 1) / interest_rate)

  @doc """
  Calculates the geometric mean of a set of returns.

  ## Formula

  (1 + rate_of_returns) ^ (1 / n) - 1

  ## Required

  * `rate_of_returns` - The rate of returns of the investment.
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
  """
  def gross_profit_margin(sales_revenue, cost_of_goods_sold),
    do: (sales_revenue - cost_of_goods_sold) / sales_revenue

  @doc """
  Calculates the interest coverage ratio of an entity.

  ## Formula

  ebit / interest_expense

  ## Required

  * `ebit` - The earnings before interest and taxes of the entity.
  * `interest_expense` - The interest expense of the entity.
  """
  def interest_coverage_ratio(ebit, interest_expense), do: ebit / interest_expense

  @doc """
  Calculates the inventory turnover ratio of an entity.

  ## Formula

  sales / inventory

  ## Required

  * `sales_revenue` - The sales/revenue of the entity.
  * `inventory` - The inventory of the entity.
  """
  def inventory_turnover_ratio(sales_revenue, inventory), do: sales_revenue / inventory

  @doc """
  Calculates the loan to deposit ratio of an entity.

  ## Formula

  total_loans / total_deposits

  ## Required

  * `total_loans` - The total loans of the entity.
  * `total_deposits` - The total deposits of the entity.
  """
  def loan_to_deposit_ratio(total_loans, total_deposits), do: total_loans / total_deposits

  @doc """
  Calculates the margin of safety of an investment.

  ## Formula

  (intrinsic_value - current_price) / intrinsic_value

  ## Required

  * `current_price` - The current price of the investment.
  * `intrinsic_value` - The intrinsic value of the investment.
  """
  def margin_of_safty(current_price, intrinsic_value),
    do: (intrinsic_value - current_price) / intrinsic_value

  @doc """
  Calculates the market capitalization of an entity.

  ## Formula

  price_per_share * outstanding_shares

  ## Required

  * `price_per_share` - The price per share of the entity.
  * `outstanding_shares` - The outstanding shares of the entity.
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
  """
  def market_to_book_ratio(market_price_per_share, book_value_per_share),
    do: market_price_per_share / book_value_per_share

  @doc """
  Calculates the net asset value of an entity.

  ## Formula

  (assets - liabilities) / shares

  ## Required

  * `assets` - The assets of the entity.
  * `liabilities` - The liabilities of the entity.
  * `shares` - The shares of the entity.
  """
  def net_asset_value(assets, liabilities, shares), do: (assets - liabilities) / shares

  @doc """
  Calculates the net intrest income of an entity.

  ## Formula

  intrest_income - intrest_expense

  ## Required

  * `intrest_income` - The intrest income of the entity.
  * `intrest_expense` - The intrest expense of the entity.
  """
  def net_intrest_income(intrest_income, intrest_expense), do: intrest_income - intrest_expense

  @doc """
  Calculates the net intrest margin of an entity.

  ## Formula

  net_intrest_income / average_earning_assets

  ## Required

  * `net_intrest_income` - The net intrest income of the entity.
  * `average_earning_assets` - The average earning assets of the entity.
  """
  def net_intrest_margin(net_intrest_income, average_earning_assets),
    do: net_intrest_income / average_earning_assets

  @doc """
  Calculates the net intrest spread of an entity.

  ## Formula

  intrest_income_rate - intrest_expense_rate

  ## Required

  * `intrest_income_rate` - The intrest income rate of the entity.
  * `intrest_expense_rate` - The intrest expense rate of the entity.
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
  """
  def net_profit_margin(net_income, sales_revenue), do: net_income / sales_revenue

  @doc """
  Calculates the net working capital of an entity.

  ## Formula

  current_assets - current_liabilities

  ## Required

  * `current_assets` - The current assets of the entity.
  * `current_liabilities` - The current liabilities of the entity.
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
  """
  def operating_margin(operating_income, sales_revenue), do: operating_income / sales_revenue

  @doc """
  Calculates the payables turnover ratio of an entity.

  ## Formula

  cost_of_goods_sold / average_accounts_payable

  ## Required

  * `cost_of_goods_sold` - The cost of goods sold of the entity.
  * `average_accounts_payable` - The average accounts payable of the entity.
  """
  def payables_turnover_ratio(cost_of_goods_sold, average_accounts_payable),
    do: cost_of_goods_sold / average_accounts_payable

  @doc """
  Calculates the payback period of an investment.

  ## Formula

  initial_investment / periodic_cash_flows

  ## Required

  * `initial_investment` - The initial investment of the entity.
  * `periodic_cash_flows` - The periodic cash flows of the entity.
  """
  def payback_period(initial_investment, periodic_cash_flows),
    do: initial_investment / periodic_cash_flows

  @doc """
  Calculates the perpetuity yield.

  ## Formula

  payment / present_value

  ## Required

  * `payment` - The payment of the entity.
  * `present_value` - The present value of the entity.
  """
  def perpetuity_yield(payment, present_value), do: payment / present_value

  @doc """
  Calculates the preferred stock value.

  ## Formula

  dividend / discount_rate

  ## Required

  * `dividend` - The dividend of the entity.
  * `discount_rate` - The discount rate of the entity.
  """
  def preferred_stock_value(dividend, discount_rate), do: dividend / discount_rate

  @doc """
  Calculates the present value.

  ## Formula

  cash_flow / (1 + rate_of_return) ^ number_of_periods

  ## Required

  * `cash_flow` - The cash flow of the entity.
  * `rate_of_return` - The rate of return of the entity.
  * `number_of_periods` - The number of periods of the entity.
  """
  def present_value(cash_flow, rate_of_return, number_of_periods),
    do: cash_flow / :math.pow(1 + rate_of_return, number_of_periods)

  @doc """
  Calculates prevent value with continuous compounding.

  ## Formula

  cash_flow / e ^ (rate * time)

  ## Required

  * `cash_flow` - The cash flow of the entity.
  * `rate` - The rate of return of the entity.
  * `time` - The number of periods of the entity.
  """
  def present_value_continuous_compounding(cash_flow, rate, time),
    do: cash_flow / :math.exp(rate * time)

  @doc """
  Calculates the present value of perpetuity.

  ## Formula

  coupon_per_period / discount_rate

  ## Required

  * `coupon_per_period` - The coupon per period of the entity.
  * `discount_rate` - The discount rate of the entity.
  """
  def present_value_of_perpetuity(coupon_per_period, discount_rate),
    do: coupon_per_period / discount_rate

  @doc """
  Calculates the price to book value.

  ## Formula

  price_per_share / book_value_per_share

  ## Required

  * `price_per_share` - The price per share of the entity.
  * `book_value_per_share` - The book value per share of the entity.
  """
  def price_to_book_value(price_per_share, book_value_per_share),
    do: price_per_share / book_value_per_share

  @doc """
  Calculates the price to cash flow.

  ## Formula

  market_capitalization / cash_flow

  ## Required

  * `market_capitalization` - The market capitalization of the entity.
  * `cash_flow` - The cash flow of the entity.
  """
  def price_to_cash_flow(market_capitalization, operating_cash_flow),
    do: market_capitalization / operating_cash_flow

  @doc """
  Calculates the price to dividend ratio.

  ## Formula

  price_per_share / dividend_per_share

  ## Required

  * `price_per_share` - The price per share of the entity.
  * `dividend_per_share` - The dividend per share of the entity.
  """
  def price_to_dividend_ratio(price_per_share, dividend_per_share),
    do: price_per_share / dividend_per_share

  @doc """
  Calculates the price to earnings ratio.

  ## Formula

  price_per_share / earnings_per_share

  ## Required

  * `price_per_share` - The price per share of the entity.
  * `earnings_per_share` - The earnings per share of the entity.
  """
  def price_to_earnings_ratio(price_per_share, earnings_per_share),
    do: price_per_share / earnings_per_share

  @doc """
  Calculates the price to sales ratio.

  ## Formula

  price_per_share / sales_per_share

  ## Required

  * `price_per_share` - The price per share of the entity.
  * `sales_per_share` - The sales per share of the entity.
  """
  def price_to_sales_ratio(price_per_share, sales_per_share),
    do: price_per_share / sales_per_share

  @doc """
  Calculates the profitability index.

  ## Formula

  present_value_of_future_cash_flows / initial_investment

  ## Required

  * `present_value_of_future_cash_flows` - The present value of future cash flows of the entity.
  * `initial_investment` - The initial investment of the entity.
  """
  def profitability_index(present_value_of_future_cash_flows, initial_investment),
    do: present_value_of_future_cash_flows / initial_investment

  @doc """
  Calculates the quick ratio.

  ## Formula

  quick_assets / current_liabilities

  ## Required

  * `quick_assets` - The quick assets of the entity.
  * `current_liabilities` - The current liabilities of the entity.
  """
  def quick_ratio(quick_assets, current_liabilities), do: quick_assets / current_liabilities

  @doc """
  Calculates the quick ratio.

  ## Formula

  (current_assets - inventory) / current_liabilities

  ## Required

  * `current_assets` - The current assets of the entity.
  * `inventory` - The inventory of the entity.
  * `current_liabilities` - The current liabilities of the entity.
  """
  def quick_ratio(current_assets, inventory, current_liabilities),
    do: (current_assets - inventory) / current_liabilities

  @doc """
  Calculates the real GDP.

  ## Formula

  nominal_gdp / gdp_deflator

  ## Required

  * `nominal_gdp` - The nominal GDP.
  * `gdp_deflator` - The GDP deflator.
  """
  def real_gdp(nominal_gdp, gdp_deflator), do: nominal_gdp / gdp_deflator

  @doc """
  Calculates the receivables turnover ratio of an entity.

  ## Formula

  net_credit_sales / average_accounts_receivable

  ## Required

  * `net_credit_sales` - The net credit sales of the entity.
  * `average_accounts_receivable` - The average accounts receivable of the entity.
  """
  def receivables_turnover_ratio(net_credit_sales, average_accounts_receivable),
    do: net_credit_sales / average_accounts_receivable

  @doc """
  Calculates the retained earnings of an entity.

  ## Formula

  net_income - dividends

  ## Required

  * `net_income` - The net income of the entity.
  * `dividends` - The dividends of the entity.
  """
  def retained_earnings(net_income, dividends), do: net_income - dividends

  @doc """
  Calculates the retention ratio.

  ## Formula

  (net_income - dividends) / net_income

  ## Required

  * `net_income` - The net income of the entity.
  * `dividends` - The dividends of the entity.
  """
  def retention_ratio(net_income, dividends), do: (net_income - dividends) / net_income

  @doc """
  Calculates the return on assets.

  ## Formula

  net_income / average_total_assets

  ## Required

  * `net_income` - The net income of the entity.
  * `average_total_assets` - The average total assets of the entity.
  """
  def return_on_assets(net_income, average_total_assets), do: net_income / average_total_assets

  @doc """
  Calculates the return on equity.

  ## Formula

  net_income / average_shareholder_equity

  ## Required

  * `net_income` - The net income of the entity.
  * `average_shareholder_equity` - The average shareholder equity of the entity.
  """
  def return_on_equity(net_income, average_shareholder_equity),
    do: net_income / average_shareholder_equity

  @doc """
  Calculates the return on investment.

  ## Formula

  (earnings - initial_investment) / initial_investment

  ## Required

  * `initial_investment` - The initial investment of the entity.
  * `earnings` - The earnings of the entity.
  """
  def return_on_investment(initial_investment, earnings),
    do: (earnings - initial_investment) / initial_investment

  @doc """
  Calculates the risk premium.

  ## Formula

  asset_or_investment_return - risk_free_return

  ## Required

  * `asset_or_investment_return` - The asset or investment return.
  * `risk_free_return` - The risk free return.
  """
  def risk_premium(asset_or_investment_return, risk_free_return),
    do: asset_or_investment_return - risk_free_return

  @doc """
  Calculates the rule of 72.

  ## Formula

  72 / rate_of_return

  ## Required

  * `rate_of_return` - The rate of return as a whole number.
  """
  def rule_of_72(rate_of_return), do: 72 / rate_of_return

  @doc """
  Calculates the simple interest.

  ## Formula

  principal * interest_rate * time

  ## Required

  * `principal` - The principal amount.
  * `interest_rate` - The interest rate.
  * `time` - The time.
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
  """
  def straight_line_depreciation(initial_value, salvage_value, useful_life),
    do: (initial_value - salvage_value) / useful_life

  @doc """
  Calculates the tax equivalent yield.

  ## Formula

  tax_free_yield / (1 - tax_rate)

  ## Required

  * `tax_free_yield` - The tax free yield.
  * `tax_rate` - The tax rate.
  """
  def tax_equivalent_yield(tax_free_yield, tax_rate), do: tax_free_yield / (1 - tax_rate)

  @doc """
  Calculates the times interest earned ratio.

  ## Formula

  ebit / interest_expense

  ## Required

  * `ebit` - The earnings before interest and taxes of the entity.
  * `interest_expense` - The interest expense of the entity.
  """
  def times_interest_earned_ratio(ebit, interest_expense), do: ebit / interest_expense

  @doc """
  Calculates the total stock return.

  ## Formula

  (ending_stock_price - initial_stock_price + dividends) / initial_stock_price

  ## Required

  * `initial_stock_price` - The initial stock price.
  * `ending_stock_price` - The ending stock price.
  * `dividends` - The dividends.
  """
  def total_stock_return(initial_stock_price, ending_stock_price, dividends),
    do: (ending_stock_price - initial_stock_price + dividends) / initial_stock_price

  @doc """
  Calculates the weighted average.

  ## Formula

  (weight1 * value1) + (weight2 * value2) + ... + (weightN * valueN)

  ## Required

  * `list` - The list of weights and values.
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
  """
  def year_over_year(current_year, previous_year),
    do: (current_year - previous_year) / previous_year

  @doc """
  Transforms a number to a percentage.

  ## Required

  * `number` - The number to transform.
  """
  def to_percentage(number), do: number * 100
end
