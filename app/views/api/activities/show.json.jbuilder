json.array!(@kit_dic) do |kd|
  json.extract! kd, :word, :introduction
end
