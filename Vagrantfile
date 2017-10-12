# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

    class Username
        def to_s
            print "**** Zulip configuration ****\n"
            print "Enter your Zulip username (e.g. alyssa@hacker.net)\n" 
            print "Username: "
            STDIN.gets.chomp
        end
    end

    class ZRealm
        def to_s
            print "Enter your Zulip realm (e.g. recurse.zulipchat.com)\n" 
            print "Realm: "
            STDIN.gets.chomp
        end
    end
    
    class APIKey
        def to_s
            print "Enter your Zulip API key, which you can get from\n"
            print "the 'Your Account' section of the Zulip settings page\n"
            print "and looks like: RJNPQKKRKbvYvGI323y91QB9p5r15cxf\n"
            print "API key: " 
            STDIN.gets.chomp
        end
    end

  config.vm.provision "file", source: "owl", destination: "$HOME/.owl"

  config.vm.provision "file", source: "barnowl-256color.sh", destination: "$HOME/zulip-barnowl"

  config.vm.provision "shell", env: {"ZULIP_USERNAME" => Username.new, "ZULIP_REALM" => ZRealm.new, "ZULIP_APIKEY" => APIKey.new}, path: "setup_barnowl_zulip.sh"

  config.ssh.forward_x11 = true

  config.vm.provision "shell", inline: <<-SHELL
echo "******** Provisioning complete!"
echo "******** Now log in with 'vagrant ssh' and run './zulip-barnowl'."
echo "******** Happy zuliping!"
SHELL

end