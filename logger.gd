class_name Logger
extends Node

enum LogVerbosity {Error = 0, Warning = 1, Log = 2, Verbose = 3, VeryVerbose = 4}

static func LOG(Category : String, Verbosity : LogVerbosity, Text : String):
	var system_time = Time.get_unix_time_from_system()
	var subseconds = floor(fmod(system_time, 1.0) * 1000)
	system_time = floor(system_time)
	
	# Prepare string
	var timeString = Time.get_datetime_string_from_unix_time(system_time) + ":" + str(subseconds)

	# Final string
	var finalString = "[" + timeString + "] " + _LogVerbosity_to_string(Verbosity) + " " + Category + ": " + Text
	
	var hasCategory = LoggerConfig.LogCategories.has(Category)
	if hasCategory:
		if Verbosity <= LoggerConfig.LogCategories[Category]:
			if Verbosity == LogVerbosity.Error:
				push_error(finalString)
				return
			if Verbosity == LogVerbosity.Warning:
				push_warning(finalString)
				return
			print(finalString)
	else:
		if Verbosity == LogVerbosity.Error:
			push_error(finalString)
			return
		if Verbosity == LogVerbosity.Warning:
			push_warning(finalString)
			return
		print(finalString)

static func _LogVerbosity_to_string(Verbosity : LogVerbosity) -> String:
	if Verbosity == LogVerbosity.Error:
		return "Error"
	if Verbosity == LogVerbosity.Warning:
		return "Warning"
	if Verbosity == LogVerbosity.Log:
		return "Log"
	if Verbosity == LogVerbosity.Verbose:
		return "Verbose"
	if Verbosity == LogVerbosity.VeryVerbose:
		return "VeryVerbose"
	return ""
