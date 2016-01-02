json.array!(@participants) do |participant|
  json.extract! participant, :id, :name, :grade, :comment
  json.url participant_url(participant, format: :json)
end
