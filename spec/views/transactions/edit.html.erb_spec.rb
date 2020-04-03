require 'rails_helper'

RSpec.describe 'transactions/edit', type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
                                          name: 'MyString',
                                          amount: 1,
                                          user: nil,
                                          group: nil
                                        ))
  end

  it 'renders the edit transaction form' do
    render

    assert_select 'form[action=?][method=?]', transaction_path(@transaction), 'post' do
      assert_select 'input[name=?]', 'transaction[name]'

      assert_select 'input[name=?]', 'transaction[amount]'

      assert_select 'input[name=?]', 'transaction[user_id]'

      assert_select 'input[name=?]', 'transaction[group_id]'
    end
  end
end
