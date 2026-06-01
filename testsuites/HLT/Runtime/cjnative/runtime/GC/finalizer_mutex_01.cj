import std.runtime.*
import std.sync.*

let gMutex = Mutex()
let gCond = synchronized(gMutex) { gMutex.condition() }
var gReady: Bool = false

class FinalizerDemo {
    init() {}

    ~init() {
        synchronized(gMutex) {
            while (!gReady) {
                gCond.wait()
            }
        }
    }
}

func createFinalizerDemo(): Unit {
    let demo = FinalizerDemo()
    blackBox(demo)
}

main() {
    let notifier = spawn {
        sleep(500 * Duration.millisecond)
        synchronized(gMutex) {
            gReady = true
            gCond.notifyAll()
        }
    }

    createFinalizerDemo()
    gc(heavy: true)
    notifier.get()
    sleep(200 * Duration.millisecond)
}

