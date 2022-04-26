json.extract! ticket, :id, :name, :valor, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
