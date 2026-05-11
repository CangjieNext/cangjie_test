/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.time.*
import std.collection.*
import std.random.*
import std.math.*
import std.sort.SortExtension
import std.sync.*

var insertNode = 0
var runTime = 0
var insertTime = 0
var remove1 = 0
var remove2 = 0
var findTime = 0
var findGreatestLessThanTime = 0
var bigen_time = DateTime.now()

class Timer {
    public func getTime(): Float64 {
        let time = DateTime.now()
        return Float64((time - bigen_time).toNanoseconds()) / 1000000.0
    }
}

func performanceNow(): Float64 {
    return Timer().getTime()
}

func deBugLog(str: String) {
    println(str)
}

let kSplayTreeSize = 8000
let kSplayTreeModifications = 80
let kSplayTreePayloadDepth = 5
var splaySampleTimeStart = 0.0
var splaySamples: ArrayList<Float64> = ArrayList<Float64>()
var seed: UInt64 = 49734321

type SetupFunction = () -> Any

type SplayFunction<T> = () -> T

abstract class Runner {
    public func notifyError(name: String, error: String): Unit

    public func notifyStep(name: String): Unit
}

class SuiteData {
    var runs: Int = 0
    var elapsed: Float64 = 0.0
    init(runs: Int, elapsed: Float64) {
        this.runs = runs
        this.elapsed = elapsed
    }
}

class SplayLatency1 {
    var name: String
    var doWarmup: Bool
    var doDeterministic: Bool
    var run: SplayFunction<Unit>
    var setup: ?SplayFunction<Unit>
    var tearDown: ?SplayFunction<Unit>
    var latencyResult: ?SplayFunction<ArrayList<Float64>>
    var minIterations: Int64

    init(
        name: String,
        doWarmup: Bool,
        doDeterministic: Bool,
        run: SplayFunction<Unit>,
        setup!: ?SplayFunction<Unit> = None,
        tearDown!: ?SplayFunction<Unit> = None,
        latencyResult!: ?SplayFunction<ArrayList<Float64>> = None,
        minIterations!: Int64 = 32
    ) {
        this.name = name
        this.doWarmup = doWarmup
        this.doDeterministic = doDeterministic
        this.run = run
        this.setup = setup
        this.tearDown = tearDown
        this.latencyResult = latencyResult
        this.minIterations = minIterations
    }
}

class BenchmarkResult {
    var benchmark: SplayLatency1
    var time: Float64
    var latency: Float64

    init(benchmark: SplayLatency1, time: Float64, latency: Float64) {
        this.benchmark = benchmark
        this.time = time
        this.latency = latency
    }

    func valueOf(): Float64 {
        return this.time
    }
}

class BenchmarkSuite {
    let name: String
    let reference: Array<Int>
    var benchmarks: Array<SplayLatency1>
    var results: ArrayList<BenchmarkResult> = ArrayList<BenchmarkResult>()
    var runner: ?Runner = Option<Runner>.None
    static var suites = ArrayList<BenchmarkSuite>()
    static let version = "9"
    static var scores: Array<Float64> = []

    init(name: String, reference: Array<Int>, benchmarks: Array<SplayLatency1>) {
        this.name = name
        this.reference = reference
        this.benchmarks = benchmarks
        BenchmarkSuite.suites.add(this)
    }

    static func ResetRNG() {
        seed = 49734321
    }
    static func random(): Float64 {
        seed = ((seed + 0x7ed55d16) + (seed << 12)) & 0xffffffff
        seed = ((seed ^ 0xc761c23c) ^ (seed >> 19)) & 0xffffffff
        seed = ((seed + 0x165667b1) + (seed << 5)) & 0xffffffff
        seed = ((seed + 0xd3a2646c) ^ (seed << 9)) & 0xffffffff
        seed = ((seed + 0xfd7046c5) + (seed << 3)) & 0xffffffff
        seed = ((seed ^ 0xb55a4f09) ^ (seed >> 16)) & 0xffffffff
        return Float64(seed) / Float64(0x10000000)
    }

    func RunStep(runner: Runner): Option<Any> {
        BenchmarkSuite.ResetRNG()
        this.results = ArrayList<BenchmarkResult>()
        this.runner = runner
        let length = this.benchmarks.size
        var index = 0
        let suite = this
        var data: ?SuiteData = Option<SuiteData>.None

        func runNextBenchmark(): Option<Any> {
            data = suite.RunSingleBenchmark(suite.benchmarks[index], DATA: data)
            if (data.isNone()) {
                suite.benchmarks[index].tearDown.getOrThrow()()
                index += 1
                if (index < length) {
                    suite.benchmarks[index].setup.getOrThrow()()
                    return runNextBenchmark()
                }
                return Option<Any>.None
            } else {
                return runNextBenchmark()
            }
        }

        func runNextSetup(): Option<Any> {
            if (index < length) {
                suite.benchmarks[index].setup.getOrThrow()()
                return runNextBenchmark()
            }
            return Option<Any>.None
        }

        func runNextTearDown(): Option<Any> {
            suite.benchmarks[index].tearDown.getOrThrow()()
            index += 1
            return runNextSetup()
        }

        return runNextSetup()
    }

    static func RunSuites(runner: Runner) {
        var continuation: ?Any = Option<Any>.None
        let SUITES = BenchmarkSuite.suites
        let length = SUITES.size
        BenchmarkSuite.scores = []
        var index = 0
        func runStep(): Unit {
            while (continuation.isSome() || index < length) {
                if ((continuation as SetupFunction).isSome()) {
                    let con = (continuation as SetupFunction).getOrThrow()
                    continuation = con()
                } else {
                    let suite = SUITES[index]
                    index += 1
                    continuation = suite.RunStep(runner)
                }

                if (continuation.isSome()) {
                    runStep()
                    return
                }
            }
        }
        runStep()
    }

    func RunSingleBenchmark(benchmark: SplayLatency1, DATA!: ?SuiteData = Option<SuiteData>.None): ?SuiteData {
        var data = DATA
        func Measure(data!: ?SuiteData = Option<SuiteData>.None) {
            var elapsed: Float64 = 0.0
            let start: Float64 = performanceNow()
            var i = 0
            if (benchmark.doDeterministic) {
                while (i < benchmark.minIterations) {
                    benchmark.run()
                    elapsed = performanceNow() - start
                    i += 1
                }
            } else {
                while (elapsed < 1000.0) {
                    benchmark.run()
                    elapsed = performanceNow() - start
                    i += 1
                }
            }

            if (data.isSome()) {
                data.getOrThrow().runs += i
                data.getOrThrow().elapsed += elapsed
            }
        }
        if (!benchmark.doWarmup && data.isNone()) {
            data = SuiteData(0, 0.0)
        }

        if (data.isNone()) {
            Measure(data: Option<SuiteData>.None)
            return SuiteData(0, 0.0)
        } else {
            Measure(data: data)
            if (data.getOrThrow().runs < benchmark.minIterations) {
                return data
            }
            let usec = Float64(data.getOrThrow().elapsed * 1_000.0) / Float64(data.getOrThrow().runs)
            let latencySamples: ArrayList<Float64>
            if (benchmark.latencyResult.isSome()) {
                latencySamples = benchmark.latencyResult.getOrThrow()()
            } else {
                latencySamples = ArrayList<Float64>([0.0])
            }

            let percentile = 99.5
            let latency = averageAbovePercentile(latencySamples, percentile) * 1_000.0
            let benchmarkResult = BenchmarkResult(benchmark, usec, latency);
            notifyStep(benchmarkResult)
            println("SplayLatency1: ms = ${latency / 1000.0}")
            return Option<SuiteData>.None
        }
    }

    func averageAbovePercentile(numbers: ArrayList<Float64>, percentile: Float64): Float64 {
        var numbersCopy = numbers
        numbersCopy.sort()

        var numbersWeWant: ArrayList<Float64> = ArrayList<Float64>([])
        let originalLength = Float64(numbersCopy.size)
        while (Float64(numbersCopy.size) / originalLength > percentile / 100.0) {
            numbersWeWant.add(numbersCopy.remove(at: numbersCopy.size - 1))
        }
        var sum = 0.0
        for (number in numbersWeWant) {
            sum += number
        }
        let result = sum / Float64(numbersWeWant.size)
        if (!numbersCopy.isEmpty() && result < numbersCopy[numbersCopy.size - 1]) {
            return result
        }
        return result
    }

    static func formatScore(value: Float64): String {
        if (value > 100.0) {
            return value.toString()
        } else {
            return value.toString()
        }
    }

    func notifyStep(result: BenchmarkResult) {
        this.results.add(result)
        if (this.runner.getOrThrow().notifyStep is ((String) -> Unit)) {
            this.runner.getOrThrow().notifyStep(result.benchmark.name)
        }
    }

    func notifyError(error: String) {
        if (this.runner.isSome()) {
            runner.getOrThrow().notifyError(this.name, error)
        }
        if (this.runner.isSome()) {
            runner.getOrThrow().notifyStep(this.name)
        }
    }
}


class SplayTree {
    var root_: ?Node = None

    func isEmpty(): Bool {
        return this.root_.isNone()
    }

    func insert(key: Float64, value: Object): Unit {
        if (this.isEmpty()) {
            this.root_ = Node(key, value)
            insertNode++;
            return
        }

        this.splay_(key)
        insertTime++
        if (this.root_?.key == key) {
            return
        }
        let node: Node = Node(key, value)
        insertNode++;
        if (key > ((this.root_?.key).getOrThrow()).getOrThrow()) {
            node.left = this.root_
            node.right = (this.root_?.right).getOrThrow()
            this.root_?.right = None
        } else {
            node.right = this.root_
            node.left = (this.root_?.left).getOrThrow()
            this.root_?.left = None
        }
        this.root_ = node
    }

    func remove(key: Float64): ?Node {
        if (this.isEmpty()) {
            return Option<Node>.None
        }
        this.splay_(key)
        remove1++
        if (this.root_?.key != key) {
            return Option<Node>.None
        }
        let removed: ?Node = this.root_
        if ((this.root_?.left).getOrThrow().isNone()) {
            this.root_ = (this.root_?.right).getOrThrow()
        } else {
            let right: Option<Node> = (this.root_?.right).getOrThrow()
            this.root_ = (this.root_?.left).getOrThrow()
            this.splay_(key)
            remove2++
            this.root_?.right = right
        }

        return removed
    }

    func find(key: Float64): ?Node {
        if (this.isEmpty()) {
            return None
        }
        this.splay_(key)
        findTime++
        if ((this.root_?.key).getOrThrow() == key) {
            return this.root_
        } else {
            return None
        }
    }

    func findMax(opt_startNode!: ?Node = Option<Node>.None): ?Node {
        if (this.isEmpty()) {
            return None
        }
        var current: ?Node = opt_startNode ?? this.root_

        while (current.getOrThrow().right.isSome()) {
            current = current.getOrThrow().right
        }
        return current
    }

    func findGreatestLessThan(key: Float64): ?Node {
        if (this.isEmpty()) {
            return None
        }

        this.splay_(key)
        findGreatestLessThanTime++
        if (this.root_.getOrThrow().key.getOrThrow() < key) {
            return this.root_
        } else if (this.root_.getOrThrow().left.isSome()) {
            return this.findMax(opt_startNode: this.root_.getOrThrow().left)
        } else {
            return None
        }
    }

    func exportKeys(): ArrayList<Float64> {
        let result = ArrayList<Float64>([])
        if (!this.isEmpty()) {
            this.root_.getOrThrow().traverse_({node: Node => result.add((node.key).getOrThrow())})
        }
        return result
    }

    func splay_(key: Float64) {
        insertNode++
        if (this.isEmpty()) {
            return
        }

        let dummy: ?Node = Node(0.0, Object())

        var left: ?Node = dummy
        var right: ?Node = dummy
        var current: Node = this.root_.getOrThrow()
        while (true) {
            if (key < current.key.getOrThrow()) {
                if (current.left.isNone()) {
                    break
                }
                if (key < (current.left.getOrThrow().key ?? 0.0)) {
                    let tmp: Node = (current.left).getOrThrow()
                    current.left = tmp.right
                    tmp.right = current
                    current = tmp
                    if (current.left.isNone()) {
                        break
                    }
                }
                right.getOrThrow().left = current
                right = current
                current = current.left.getOrThrow()
            } else if (key > current.key.getOrThrow()) {
                if (current.right.isNone()) {
                    break
                }
                if (key > (current.right.getOrThrow().key ?? 0.0)) {
                    let tmp: Node = current.right.getOrThrow()
                    current.right = tmp.left
                    tmp.left = current
                    current = tmp
                    if (current.right.isNone()) {
                        break
                    }
                }
                left.getOrThrow().right = current
                left = current
                current = current.right.getOrThrow()
            } else {
                break
            }
        }
        left?.right = current.left
        right?.left = current.right
        current.left = dummy.getOrThrow().right
        current.right = dummy.getOrThrow().left
        this.root_ = current
    }
}

var splayTree: ?SplayTree = Option<SplayTree>.None

class Node {
    var key: ?Float64
    var value: Object
    var left: ?Node = None
    var right: ?Node = None

    init(key: ?Float64, value: Object) {
        this.key = key
        this.value = value
    }

    func traverse_(f: ((Node) -> Unit)): Unit {
        var current: ?Node = this
        while (current.isSome()) {
            let left: ?Node = (current?.left).getOrThrow()
            if (left.isSome()) {
                left?.traverse_(f)
            }
            f(current.getOrThrow())
            current = (current?.right).getOrThrow()
        }
    }
}

class PayloadTreeLastNode {
    var array: Array<Int32>
    var string: String
    init(array: Array<Int32>, string: String) {
        this.array = array
        this.string = string
    }
}

class PayloadTreeNode {
    var left: Object
    var right: Object
    init(left: Object, right: Object) {
        this.left = left
        this.right = right
    }
}

class SplayLatency <: Runner {
    func generateKey(): Float64 {
        return BenchmarkSuite.random();
    }
    func SplayLatency(): ArrayList<Float64> {
        return splaySamples;
    }
    func splayUpdateStats(time: Float64) {
        let pause = time - splaySampleTimeStart
        splaySampleTimeStart = time
        splaySamples.add(pause)
    }

    func generatePayloadTree(depth: Int, tag: String): Object {
        if (depth == 0) {
            return PayloadTreeLastNode([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], "String for key" + tag + "in leaf node")
        } else {
            return PayloadTreeNode(generatePayloadTree(depth - 1, tag), generatePayloadTree(depth - 1, tag))
        }
    }

    func insertNewNode(): Float64 {
        var key: Float64
        do {
            key = generateKey()
        } while ((splayTree.getOrThrow().find(key)).isSome())
        let payload = generatePayloadTree(kSplayTreePayloadDepth, key.toString())
        splayTree.getOrThrow().insert(key, payload)

        return key
    }

    func SplayRun() {
        runTime++
        for (_ in 0..kSplayTreeModifications) {
            let key = insertNewNode()
            let greatest = splayTree.getOrThrow().findGreatestLessThan(key)
            if (greatest.isNone()) {
                _ = splayTree.getOrThrow().remove(key)
            } else {
                _ = splayTree.getOrThrow().remove((greatest.getOrThrow().key).getOrThrow())
            }
        }
        splayUpdateStats(performanceNow())
    }
    func SplaySetup() {
        splayTree = SplayTree()
        splaySampleTimeStart = performanceNow()
        for (i in 0..kSplayTreeSize) {
            _ = insertNewNode()
            if ((i + 1) % 20 == 19) {
                splayUpdateStats(performanceNow())
            }
        }
    }
    func SplayTearDown() {
        let keys: ArrayList<Float64> = splayTree.getOrThrow().exportKeys()
        splayTree = Option<SplayTree>.None
        splaySamples = ArrayList<Float64>([])
        let length = keys.size
        if (length != kSplayTreeSize) {
            return
        }

        for (i in 0..length - 1) {
            if (keys[i] >= keys[i + 1]) {
                return
            }
        }
    }

    public func notifyError(name: String, error: String) {
    }
    public func notifyStep(name: String) {
    }
}

let splayLatency = SplayLatency()

func start() {
    BenchmarkSuite.RunSuites(splayLatency)
}

main() {
    let benchmark = SplayLatency1("Splay", true, false, splayLatency.SplayRun, setup: splayLatency.SplaySetup,
        tearDown: splayLatency.SplayTearDown, latencyResult: splayLatency.SplayLatency, minIterations: 32)
    let benchmarkSuite = BenchmarkSuite("Splay", [81491, 2739514], [benchmark])
    start()
}
