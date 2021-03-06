module Api
  class DashboardController < ApplicationController
    # before_action :doorkeeper_authorize!

    def index
      data = {}
      data[:users] = User.alive.order(last_activity: :desc).limit(4)
      data[:orders] = Order.order(created_at: :asc).in_progress
        .as_json(include: { company: {} }).take(4)
      data[:count] = {
        not_started: Order.not_started.count, in_progress: Order.in_progress.count,
        canceled: Order.canceled.count, finished: Order.finished.count,
      }
      json_response data
    end
  end
end
