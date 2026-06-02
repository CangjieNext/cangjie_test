// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: WaitNotifyBase.cj
// DEPENDENCE: WaitNotifySingleLock.cj
// EXEC: %compiler %cmp_opt %enableO2 --int-overflow=wrapping %f WaitNotifySingleLock.cj WaitNotifyBase.cj -o %output

import std.process.*
import std.convert.*
import std.sync.*
import std.time.*
import std.collection.ArrayList

let NS_PER_MS = 1000000
let WARMUP_TIME = 1000
let BENCH_TIME = 10000
public let CONSUMING_UNIT = Object()
public let WAIT_TIME = Duration.nanosecond * 100

public class WorkList {
    private let contains: AtomicInt64 = AtomicInt64(0)

    public func isEmpty(): Bool {
        return contains.load() == 0
    }

    public func push(data: Object): Unit {
        contains.fetchAdd(1)
    }

    public func pop(): Object {
        if (isEmpty()) {
            print("Should not reach here")
            throw Exception()
        }
        contains.fetchSub(1)
        return CONSUMING_UNIT
    }
}

public abstract class Consumer {
    protected let id: Int64
    protected let workList: WorkList
    public var consumed = 0

    public let shouldStop: AtomicBool = AtomicBool(false)

    public init(id: Int64, workList: WorkList) {
        this.id = id
        this.workList = workList
    }

    protected func consumerLoop(): Unit

    public func run(): Unit {
        while (!shouldStop.load()) {
            consumerLoop()
        }
    }
}

public abstract class Producer {
    protected let id: Int64
    protected let workList: WorkList
    protected let VALUE_PER_PRODUCER: Int64
    public let shouldStop: AtomicBool = AtomicBool(false)

    private let startSignal: SyncCounter

    public init(id: Int64, workList: WorkList, valPerProducer: Int64, startSignal: SyncCounter) {
        this.startSignal = startSignal
        this.id = id
        this.workList = workList
        this.VALUE_PER_PRODUCER = valPerProducer
    }

    protected func producerLoop(): Unit

    public func run(): Unit {
        startSignal.waitUntilZero()
        while (!shouldStop.load()) {
            this.producerLoop()
        }
    }
}

class Spinner {
    public let shouldStop: AtomicBool = AtomicBool(false)
    private let id: Int64
    private let startSignal: SyncCounter

    public init(id: Int64, startSignal: SyncCounter) {
        this.startSignal = startSignal
        this.id = id
    }

    public func run() {
        startSignal.waitUntilZero()
        while (!shouldStop.load()) {}
    }
}

public abstract class WaitNotifyBench {
    public let CONSUMERS: Int64
    public let PRODUCERS: Int64
    public let VALUE_PER_PRODUCER: Int64
    public let SPINNERS: Int64
    public let workList = WorkList()

    public init(consumers: Int64, producers: Int64, valuePerProducer: Int64, spinners: Int64) {
        CONSUMERS = consumers
        PRODUCERS = producers
        VALUE_PER_PRODUCER = valuePerProducer
        SPINNERS = spinners
    }

    public func name(): String
    public func finish(): Unit

    public func createConsumer(id: Int64): Consumer
    public func createProducer(id: Int64, startSignal: SyncCounter): Producer

    private func bench(time: Int64, shouldPrint: Bool) {
        let cons = Array<Consumer>(CONSUMERS, {i => createConsumer(i)})
        let tCons = Array<Future<Unit>>(CONSUMERS, {
            i => spawn {
                => cons[i].run()
            }
        })

        let startSignalForProducers = SyncCounter(1)
        let prods = Array<Producer>(PRODUCERS, {i => createProducer(i, startSignalForProducers)})
        let tProds = Array<Future<Unit>>(PRODUCERS, {
            i => spawn {
                => prods[i].run()
            }
        })

        let startSignalForSpinners = SyncCounter(1)
        let spinners = Array<Spinner>(SPINNERS, {i => Spinner(i, startSignalForSpinners)})
        let spinnersT = Array<Future<Unit>>(SPINNERS, {
            i => spawn {
                => spinners[i].run()
            }
        })

        startSignalForSpinners.dec()

        let start = DateTime.now()

        startSignalForProducers.dec()

        sleep(Duration.nanosecond * time)

        for (i in prods) {
            i.shouldStop.swap(true)
        }

        for (i in cons) {
            i.shouldStop.swap(true)
        }

        finish()

        for (i in tProds) {
            i.get()
        }

        for (i in tCons) {
            i.get()
        }

        for (i in 0..SPINNERS) {
            spinners[i].shouldStop.swap(true)
            spinnersT[i].get()
        }

        let realTime = (DateTime.now() - start).toMilliseconds()

        var unitsConsumed = 0
        for (i in cons) {
            unitsConsumed += i.consumed
        }

        if (shouldPrint) {
            println("${name()} (p = ${PRODUCERS}, c = ${CONSUMERS}, v = ${VALUE_PER_PRODUCER}, s = ${SPINNERS})")
            println("units per ms: ${Float64(unitsConsumed) / Float64(realTime)}")
        }
    }

    public func bench() {
        bench(WARMUP_TIME * NS_PER_MS, false)
        bench(BENCH_TIME * NS_PER_MS, true)
    }
}

enum Mode {
    BASE | SIGNLELOCK
}

func parseArgs(args: ArrayList<String>): (Mode, Int64, Int64, Int64, Int64) {
    var consumers: Int64 = -1
    var producers: Int64 = -1
    var valuePerProducer: Int64 = -1
    var spinners: Int64 = -1

    var m: Mode = match (args[0]) {
        case "base" => BASE
        case "singleLock" => SIGNLELOCK
        case _ => throw Exception()
    }

    var index = 1
    while (index < args.size) {
        let arg = args[index]
        let kv = arg.split("=")
        let k = kv[0]
        let v = Int64.tryParse(kv[1]).getOrThrow()

        if (v < 0) {
            throw Exception()
        }

        match (k) {
            case "c" => consumers = v
            case "p" => producers = v
            case "v" => valuePerProducer = v
            case "s" => spinners = v
            case _ => throw Exception()
        }

        index = index + 1
    }

    return (m, consumers, producers, valuePerProducer, spinners)
}

main(): Int64 {
    try {
        let args = Process.current.arguments
        let arr = ArrayList<String>(args)
        var (mode, consumers, producers, valuePerProducer, spinners) = parseArgs(arr)

        let b = match (mode) {
            case BASE => WaitNotifyBase(consumers, producers, valuePerProducer, spinners)
            case SIGNLELOCK => WaitNotifySingleLock(consumers, producers, valuePerProducer, spinners)
        }

        b.bench()
    } catch (_) {
        print("Usage: <mode> c=<consumers> p=<producers> v=<valuePerProducer> s=<spinners>")
        return 1
    }

    return 0
}
