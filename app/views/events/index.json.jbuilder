json.array!(@events) do |event|
   json.id event.id
   json.start event.start_datetime
   json.end event.finish_datetime
   json.title event.rule
end