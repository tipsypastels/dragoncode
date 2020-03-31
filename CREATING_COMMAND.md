# Creating your own commands.

Dragoncode is open and allows you to add your own commands on a per-project basis without having to fork the transpiler. Just like regular configuration, commands are created through the `dragoncode.config.rb` file in the root of your project.

```ruby
Dragoncode::Config.configure do |config|
  # commands here
end
```

Note that you don't have to register every single custom command in your game, because Dragoncode lets all commands it doesn't recognize pass through unchanged*. However, if you want to define custom transpiler behavior, a custom command is the way to go.

* Two exceptions: Dragoncode will validate the contents of map scripts and movement scripts against a preset list of commands. If you want to add a command from your hack to this list without giving it custom behavior in Dragoncode, you can do it within the config file as well.
```ruby
config.register_movement_command(:emote_star)
config.register_map_script(:on_something) # will become MAP_SCRIPTS_ON_SOMETHING
```

## Command structure

Each command is a ruby class that extends `Dragoncode::Cmd::Base`. If you're making lots of similar commands you can also define your own class hierarchy, as long as `Dragoncode::Cmd::Base` is an ancestor. The structure of a command class looks like this (this is a simplified version of the `Say` command).

```ruby
class MyCommand < Dragoncode::Cmd::Base
  # Dragoncode has optional strong typing using the `.parameters` method.
  parameters text: Text,
             msgbox: optional(Constant)
  
  # Returns a string that becomes the output of this command
  def emit
    
  end
end
```

You are also encouraged to define your own private methods to break up complex commands rather than sticking everything in `#emit`.

## Parameters

Inside your command class, 