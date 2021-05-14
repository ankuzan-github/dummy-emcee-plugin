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
var logger: ContextualLogger?

let eventBus = EventBus()
eventBus.add(stream: MyPluginListener())
var plugin: Plugin?
do {
//    logger.info("123123123 - try block")
    plugin = try Plugin(eventBus: eventBus)
} catch {
//    logger.info("123123123 - catch block")
//    logger.info("123123123 - \(error.localizedDescription)")
}
logger = plugin?.logger
plugin?.streamPluginEvents()
logger?.info("123123123 - stream plugin events")

// Wait for plugin to finish:
plugin?.join()
