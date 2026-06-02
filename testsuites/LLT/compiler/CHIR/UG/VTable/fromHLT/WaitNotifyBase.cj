// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.sync.*

let monitorForConsumer = Monitor()
let monitorForProducer = Monitor()

class WaitNotifyBaseConsumer <: Consumer {
    public init(id: Int64, workList: WorkList) {
        super(id, workList)
    }

    public func consumerLoop() {
        synchronized(monitorForConsumer) {
            while (workList.isEmpty()) {
                if (shouldStop.load()) {
                    return
                }
                monitorForConsumer.wait()
            }

            workList.pop()
            consumed++

            if (workList.isEmpty()) {
                synchronized(monitorForProducer) {
                    monitorForProducer.notify()
                }
            }
        }
    }
}

class WaitNotifyBaseProducer <: Producer {
    public init(id: Int64, workList: WorkList, valPerProducer: Int64, startSignal: SyncCounter) {
        super(id, workList, valPerProducer, startSignal)
    }

    public func producerLoop() {
        synchronized(monitorForConsumer) {
            for (i in 0..VALUE_PER_PRODUCER) {
                workList.push(CONSUMING_UNIT)
            }
            monitorForConsumer.notifyAll()
        }

        synchronized(monitorForProducer) {
            while (!workList.isEmpty()) {
                if (shouldStop.load()) {
                    return
                }
                monitorForProducer.wait()
            }
        }
    }
}

public class WaitNotifyBase <: WaitNotifyBench {
    public init(consumers: Int64, producers: Int64, valuePerProducer: Int64, spinners: Int64) {
        super(consumers, producers, valuePerProducer, spinners)
    }

    public func name() {
        return "WaitNotifyBase"
    }

    public func finish() {
        synchronized(monitorForConsumer) {
            monitorForConsumer.notifyAll()
        }
        synchronized(monitorForProducer) {
            monitorForProducer.notifyAll()
        }
    }

    public func createConsumer(id: Int64): Consumer {
        return WaitNotifyBaseConsumer(id, workList)
    }

    public func createProducer(id: Int64, startSignal: SyncCounter): Producer {
        return WaitNotifyBaseProducer(id, workList, VALUE_PER_PRODUCER, startSignal)
    }
}
