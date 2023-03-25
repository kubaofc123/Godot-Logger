How to use:

- Activate the plugin in `Project Settings -> Plugins -> Logger`
- In code you can call logging system like this example: `Logger.LOG("LogTemp", Logger.LogVerbosity.Log, "Test log text")`
- If log category is defined in `config.gd`, if you set `LogVerbosity` in your called log to a higher number than in the config file, it will not be called. This way you can easily toggle verbosity for written logs project-wide

Configuration:
- You can configure log categories in `config.gd`, where the number corresponds to `LogVerbosity` in `Logger` class
- If you do not add a category in `config.gd`, the log will always be called