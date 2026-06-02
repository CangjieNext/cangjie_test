// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.sync.*

let lockForData = MultiConditionMonitor()

class WaitNotifySingleLockConsumer <: Consumer {
    public let conditionForConsumer: ConditionID
    public let conditionForProducer: ConditionID

    public init(id: Int64, workList: WorkList, conForConsumer: ConditionID, conForProducer: ConditionID) {
        super(id, workList)
        conditionForConsumer = conForConsumer
        conditionForProducer = conForProducer
    }

    public func consumerLoop() {
        synchronized(lockForData) {
            while (workList.isEmpty()) {
                if (shouldStop.load()) {
                    return
                }
                lockForData.wait(conditionForConsumer, timeout: WAIT_TIME)
            }

            workList.pop()
            consumed++

            if (workList.isEmpty()) {
                lockForData.notify(conditionForProducer)
            }
        }
    }
}

class WaitNotifySingleLockProducer <: Producer {
    public let conditionForConsumer: ConditionID
    public let conditionForProducer: ConditionID

    public init(id: Int64, workList: WorkList, valPerProducer: Int64, startSignal: SyncCounter,
        conForConsumer: ConditionID, conForProducer: ConditionID) {
        super(id, workList, valPerProducer, startSignal)
        conditionForConsumer = conForConsumer
        conditionForProducer = conForProducer
    }

    public func producerLoop() {
        synchronized(lockForData) {
            for (i in 0..VALUE_PER_PRODUCER) {
                workList.push(CONSUMING_UNIT)
            }
            lockForData.notifyAll(conditionForConsumer)
        }

        synchronized(lockForData) {
            while (!workList.isEmpty()) {
                if (shouldStop.load()) {
                    return
                }
                lockForData.wait(conditionForProducer, timeout: WAIT_TIME)
            }
        }
    }
}

public class WaitNotifySingleLock <: WaitNotifyBench {
    public let conditionForConsumer: ConditionID
    public let conditionForProducer: ConditionID

    public init(consumers: Int64, producers: Int64, valuePerProducer: Int64, spinners: Int64) {
        super(consumers, producers, valuePerProducer, spinners)

        synchronized(lockForData) {
            conditionForConsumer = lockForData.newCondition()
            conditionForProducer = lockForData.newCondition()
        }
    }

    public func name() {
        return "WaitNotifySingleLock"
    }

    public func finish() {
        synchronized(lockForData) {
            lockForData.notifyAll(conditionForConsumer)
            lockForData.notifyAll(conditionForProducer)
        }
    }

    public func createConsumer(id: Int64): Consumer {
        return WaitNotifySingleLockConsumer(id, workList, conditionForConsumer, conditionForProducer)
    }

    public func createProducer(id: Int64, startSignal: SyncCounter): Producer {
        return WaitNotifySingleLockProducer(id, workList, VALUE_PER_PRODUCER, startSignal, conditionForConsumer,
            conditionForProducer)
    }
}
