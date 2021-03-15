module InitialCheck

    def self.assert_required_plugins_installed(required_plugins)
        # Check if the required plugins have been installed.
        # If any are not installed, raise an error.

        missing_plugins ||= required_plugins.reject { |plugin| Vagrant.has_plugin? plugin }
        missing_plugins.each do |plugin|
            puts "The following plugin is required: #{plugin}"
            puts "Install it with this command: 'vagrant plugin install #{plugin}'"
        end
        fail "Required Vagrant plugins not installed. Please install before continuing" if missing_plugins.any?
    end

end
