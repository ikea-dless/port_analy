DEPARTMENTS = YAML.load(File.read(File.join(Rails.root, 'db', 'model_constants', 'departments.yml')))[Rails.env]
