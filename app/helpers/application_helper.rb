module ApplicationHelper

  def client_companies
    Client.pluck(:company)
  end
end
