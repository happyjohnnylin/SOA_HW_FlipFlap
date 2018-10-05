# Module that can be included (mixin) to take and output Yaml data
require 'yaml'

module YamlBuddy
    def take_yaml(yaml)
        #@data = YAML.safe_load(yaml)
        outputData = YAML.safe_load(yaml)
        @data = outputData
    end

    def to_yaml
        yml = @data.to_yaml
        yml
    end
end