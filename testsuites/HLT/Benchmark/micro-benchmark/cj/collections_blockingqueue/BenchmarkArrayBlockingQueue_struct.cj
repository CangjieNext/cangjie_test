/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.collection.concurrent.*
import std.convert.*
import std.time.*
import std.sync.*

struct IntEvent {
    let value: Int64

    public init(value: Int64) {
        this.value = value
    }

    public func isExit(): Bool {
        this.value == -1
    }

    public func toString(): String {
        "IntEvent(${this.value})"
    }

    public func name(): String {
        "int"
    }

    public func clone(): IntEvent {
        return IntEvent(value)
    }
}

struct StrEvent {
    let value: String

    public init(value: Int64) {
        this.value = "A" * value
    }
    public init(value: String) {
        this.value = value
    }

    public func isExit(): Bool {
        this.value == "exit"
    }

    public func toString(): String {
        "StrEvent(${this.value})"
    }

    public func name(): String {
        "str"
    }

    public func clone(): StrEvent {
        return StrEvent(value)
    }
}

func worker_Int(queue: ArrayBlockingQueue<IntEvent>, done: ArrayBlockingQueue<Int64>, doneTarget: Int64) {
    var n = 0
    for (_ in 0..doneTarget) {
        let e = queue.remove()
        if (!e.isExit()) {
            n += 1
        }
    }
    done.add(n)
}

func dispatchTo_Int(event: IntEvent, events: Int64, addr: ArrayBlockingQueue<IntEvent>) {
    for (_ in 0..events) {
        addr.add(event.clone())
    }
}

func worker_Str(queue: ArrayBlockingQueue<StrEvent>, done: ArrayBlockingQueue<Int64>, doneTarget: Int64) {
    var n = 0
    for (_ in 0..doneTarget) {
        let e = queue.remove()
        if (!e.isExit()) {
            n += 1
        }
    }
    done.add(n)
}

func dispatchTo_Str(event: StrEvent, events: Int64, addr: ArrayBlockingQueue<StrEvent>) {
    for (_ in 0..events) {
        addr.add(event.clone())
    }
}

@Test
@Configure[minDuration: Duration.second * 5]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_ArrayBlockingQueue_struct {
    let testgroups: Array<(Int64, Int64, Int64, Int64, Int64)> = [
        (1, 10000, 0, 64, 64), // SingleWorker
        (1, 10000, 1, 64, 64), // SingleWorker
        (8, 100000, 0, 64, 64), // Worker_N8 --baseline
        (16, 100000, 1, 64, 64), // Worker_N16
        (32, 100000, 0, 64, 64), // Worker_N32
        (64, 100000, 1, 64, 64), // Worker_N64
        (8, 100000, 1, 8, 64), // EventSize_S8
        (8, 100000, 1, 1024, 64), // EventSize_S1024
        (8, 100000, 1, 65536, 64), // EventSize_S65536
        (8, 100000, 1, 64, 16), // QueueSize_N16
        (8, 100000, 0, 64, 256), // QueueSize_N256
        (8, 100000, 1, 64, 1024), // QueueSize_N1024
        (5000, 100000, 0, 64, 128) // Worker_N5000 --stress
    ]

    // eventType: 0 - Int; 1 - Str
    func benchmark_ArrayBlockingQueue_struct_int(workers: Int64, events: Int64, eventType: Int64, eventSize: Int64,
        queueSize: Int64) {
        let address = Array<ArrayBlockingQueue<IntEvent>>(workers) {_ => ArrayBlockingQueue<IntEvent>(queueSize)}
        let event = IntEvent(eventSize)
        let done = ArrayBlockingQueue<Int64>(events)
        for (i in 0..workers) {
            spawn {
                worker_Int(address[i], done, events)
            }
        }
        for (i in 0..workers) {
            spawn {
                dispatchTo_Int(event, events, address[i])
            }
        }

        var totalEvents = 0
        for (_ in 0..workers) {
            let n = done.remove()
            totalEvents += n
        }
    }

    func benchmark_ArrayBlockingQueue_struct_str(workers: Int64, events: Int64, eventType: Int64, eventSize: Int64,
        queueSize: Int64) {
        let address = Array<ArrayBlockingQueue<StrEvent>>(workers) {_ => ArrayBlockingQueue<StrEvent>(queueSize)}
        let event = StrEvent(eventSize)
        let done = ArrayBlockingQueue<Int64>(events)
        for (i in 0..workers) {
            spawn {
                worker_Str(address[i], done, events)
            }
        }
        for (i in 0..workers) {
            spawn {
                dispatchTo_Str(event, events, address[i])
            }
        }

        var totalEvents = 0
        for (_ in 0..workers) {
            let n = done.remove()
            totalEvents += n
        }
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_SingleWorker_IntEvent() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[0]
        benchmark_ArrayBlockingQueue_struct_int(workers, events, eventType, eventSize, queueSize)
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_SingleWorker_StrEvent() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[1]
        benchmark_ArrayBlockingQueue_struct_str(workers, events, eventType, eventSize, queueSize)
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_Int_Worker_N8() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[2]
        benchmark_ArrayBlockingQueue_struct_int(workers, events, eventType, eventSize, queueSize)
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_Str_Worker_N16() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[3]
        benchmark_ArrayBlockingQueue_struct_str(workers, events, eventType, eventSize, queueSize)
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_Int_Worker_N32() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[4]
        benchmark_ArrayBlockingQueue_struct_int(workers, events, eventType, eventSize, queueSize)
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_Str_Worker_N64() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[5]
        benchmark_ArrayBlockingQueue_struct_str(workers, events, eventType, eventSize, queueSize)
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_Str_EventSize_S8() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[6]
        benchmark_ArrayBlockingQueue_struct_int(workers, events, eventType, eventSize, queueSize)
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_Str_EventSize_S1024() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[7]
        benchmark_ArrayBlockingQueue_struct_str(workers, events, eventType, eventSize, queueSize)
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_Str_EventSize_S65536() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[8]
        benchmark_ArrayBlockingQueue_struct_int(workers, events, eventType, eventSize, queueSize)
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_Str_QueueSize_N16() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[9]
        benchmark_ArrayBlockingQueue_struct_str(workers, events, eventType, eventSize, queueSize)
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_Int_QueueSize_N256() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[10]
        benchmark_ArrayBlockingQueue_struct_int(workers, events, eventType, eventSize, queueSize)
    }

    @Bench
    func BenchmarkArrayBlockingQueue_struct_Str_QueueSize_N1024() {
        let (workers, events, eventType, eventSize, queueSize) = testgroups[11]
        benchmark_ArrayBlockingQueue_struct_str(workers, events, eventType, eventSize, queueSize)
    }

    // @Bench
    // func BenchmarkArrayBlockingQueue_struct_Worker_N5000() {
    //     let (workers, events, eventType, eventSize, queueSize) = testgroups[12]
    //     benchmark_ArrayBlockingQueue_struct(workers, events, eventType, eventSize, queueSize)
    // }
}
