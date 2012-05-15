class TransactionsController < ApplicationController
  def reset_all
    Transaction.delete_all

    redirect_to root_path
  end
end
