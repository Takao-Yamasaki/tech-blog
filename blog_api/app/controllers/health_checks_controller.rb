class HealthChecksController < ApplicationController
  def index
    # 200番を返す
    head :ok
  end
end
