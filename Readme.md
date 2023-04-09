How to install:
- Download and extract contents of this repository to `{YourProject}/addons/logger/`
- Activate the plugin in `Project Settings -> Plugins -> Logger`

How to use:
- In code you can call logging system like this example: `Logger.LOG(self, "LogTemp", Logger.LogVerbosity.Log, "Test log text")`
- If log category is defined in `config.gd`, if you set `LogVerbosity` in your called log to a higher number than in the config file, it will not be called. This way you can easily toggle verbosity for written logs project-wide
- Log system will automatically detect if multiplayer is running and print Server/Client messages

Final console output will look like this:

`[2023-03-25T20:02:49:2] Log LogTemp: Test log text`

`[2023-03-25T20:02:49:2] Log LogTemp: SERVER: node_1:<Node#36775658709>: Test log text`

`[2023-03-25T20:02:49:2] Log LogTemp: CLIENT 12345: node_1:<Node#36775658709>: Test log text`

`{date/time} {Verbosity} {Category} {Server/Client/None} {Message}`


Configuration:
- You can configure log categories in `config.gd`, where the number corresponds to `LogVerbosity` in `Logger` class
- If you do not add a category in `config.gd`, the log will always be called
