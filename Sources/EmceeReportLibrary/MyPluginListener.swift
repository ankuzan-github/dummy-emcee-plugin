import EventBus
import Plugin
import Logging
import SimulatorVideoRecorder
import PathLib
import ProcessController
import FileSystem
import DateProvider
import TestsWorkingDirectorySupport
import Foundation
import EmceeLogging

public class MyPluginListener: DefaultBusListener {
    
    let logger: ContextualLogger
    
    public init(logger: ContextualLogger) {
        self.logger = logger
        logger.info("123123123 - plugin instantiated")
    }
    
    public override func runnerEvent(_ event: RunnerEvent) {
        let context = event.testContext        
        switch event {
        case .willRun(let testEntries, let testContext):
            break
        case .didRun(let testEntryResults, let testContext):
            break
        case .testStarted(let testEntry, let testContext):
            logger.info("123123123 - test started: \(testEntry.testName.stringValue)")
            break
        case .testFinished(let testEntry, let succeeded, let testContext):
            logger.info("123123123 - test finished: \(testEntry.testName.stringValue)")
            
            break
        }
    }

    public override func tearDown() {
        // will be called before Emcee will terminate your plugin
        // close your pipes here
    }
    
}
