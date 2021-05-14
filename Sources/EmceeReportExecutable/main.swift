import EmceeReportLibrary
import EventBus
import LoggingSetup
import Logging
import EmceeLogging
import Plugin
import FileSystem
import DateProvider

// Make use of Emcee logging
// Logs will be written to a hosting machine
// at ~/Library/Logs/ru.avito.emcee.logs/Plugin/
let logger = try LoggingSetup(
    dateProvider: SystemDateProvider(),
    fileSystem: LocalFileSystem()
).setupLogging(stderrVerbosity: Verbosity.debug)

logger.info("123123123 - plugin started")

// Create an event bus that will get the events from the Emcee
let eventBus = EventBus()
logger.info("123123123 - event bus created")

// Subscribe to the event bus by providing your instance of EventStream
eventBus.add(stream: MyPluginListener(logger: logger))
logger.info("123123123 - plugin added to event bus")

// Plugin class will stream all events into event bus
var plugin: Plugin?
do {
    logger.info("123123123 - try block")
    plugin = try Plugin(eventBus: eventBus)
} catch {
    logger.info("123123123 - catch block")
    logger.info("123123123 - \(error.localizedDescription)")
}
logger.info("123123123 - create Plugin instance")
plugin?.streamPluginEvents()
logger.info("123123123 - stream plugin events")

// Wait for plugin to finish:
plugin?.join()
