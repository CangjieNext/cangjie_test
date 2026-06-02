/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb %export cjRegionSize=4kb && %run %run_opt %output 10 2>&1 | compare %f
// ASSERT: scan ms

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
    // ms
    public func getTime(): Float64 {
        let time = DateTime.now()
        return Float64((time - bigen_time).toNanoseconds()) / 1000000.0
        // return Float64(time.second) * 1000.0 + Float64(time.nanosecond)/ 1000000.0
    }
}

// Performance.now is used in latency benchmarks, the fallback is Date.now.
func performanceNow(): Float64 {
    return Timer().getTime()
}

func deBugLog(str: String) {
    println(str)
}

// Configuration.
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
// Simple framework for running the benchmark suites and
// computing a score based on the timing measurements.

// A benchmark has a name (string) and a function that will be run to
// do the performance measurement. The optional setup and tearDown  
// arguments are functions that will be invoked before and after
// running the benchmark, but the running time of these functions will
// not be accounted for in the benchmark score.

/*
 * @State
 * @Tags Jetstream2
 */
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

// SplayLatency1 results hold the benchmark and the measured time used to
// run the benchmark. The benchmark score is computed later once a
// full benchmark suite has run to completion. If latency is set to 0
// then there is no latency score for this benchmark.

class BenchmarkResult {
    var benchmark: SplayLatency1
    var time: Float64
    var latency: Float64

    init(benchmark: SplayLatency1, time: Float64, latency: Float64) {
        this.benchmark = benchmark
        this.time = time
        this.latency = latency
    }

    // Automatically convert results to numbers. Used by the geometric
    // mean computation.
    func valueOf(): Float64 {
        return this.time
    }
}

// Suites of benchmarks consist of a name and the set of benchmarks in
// addition to the reference timing that the final score will be based
// on. This way, all scores are relative to a reference run and higher
// scores implies better performance.

class BenchmarkSuite {
    let name: String
    let reference: Array<Int>
    var benchmarks: Array<SplayLatency1>
    var results: ArrayList<BenchmarkResult> = ArrayList<BenchmarkResult>()
    var runner: ?Runner = Option<Runner>.None
    // Keep track of all declared benchmark suites.
    static var suites = ArrayList<BenchmarkSuite>()
    static let version = "9"
    static var scores: Array<Float64> = []

    init(name: String, reference: Array<Int>, benchmarks: Array<SplayLatency1>) {
        this.name = name
        this.reference = reference
        this.benchmarks = benchmarks
        BenchmarkSuite.suites.add(this)
    }

    // To make the benchmark results predictable, we replace Math.random
    // with a 100% deterministic alternative.
    static func ResetRNG() {
        seed = 49734321
    }
    static func random(): Float64 {
        // Robert Jenkins' 32 bit integer hash function.
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

        // @SplayLatency1
        func runNextBenchmark(): Option<Any> {
            data = suite.RunSingleBenchmark(suite.benchmarks[index], DATA: data)
            // If data is nil, we're done with this benchmark.
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

        //@Setup
        // Run the setup, the actual benchmark, and the tear down in three
        // separate steps to allow the framework to yield between any of the
        // steps.
        func runNextSetup(): Option<Any> {
            if (index < length) {
                suite.benchmarks[index].setup.getOrThrow()()
                return runNextBenchmark()
            }
            return Option<Any>.None
        }

        // @Teardown
        func runNextTearDown(): Option<Any> {
            suite.benchmarks[index].tearDown.getOrThrow()()
            index += 1
            return runNextSetup()
        }

        return runNextSetup()
    }

    // Runs all registered benchmark suites and optionally yields between
    // each individual benchmark to avoid running for too long in the
    // context of browsers. Once done, the final score is reported to the
    // runner.
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

    // Runs a single benchmark for at least a second and computes the
    // average time it takes to run a single iteration.
    func RunSingleBenchmark(benchmark: SplayLatency1, DATA!: ?SuiteData = Option<SuiteData>.None): ?SuiteData {
        var data = DATA
        func Measure(data!: ?SuiteData = Option<SuiteData>.None) {
            var elapsed: Float64 = 0.0
            let start: Float64 = performanceNow()
            var i = 0
            // Run either for 1 second or for the number of iterations specified
            // by minIterations, depending on the config flag doDeterministic.
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
        // Sets up data in order to skip or not the warmup phase.
        if (!benchmark.doWarmup && data.isNone()) {
            data = SuiteData(0, 0.0)
        }

        if (data.isNone()) {
            Measure(data: Option<SuiteData>.None)
            return SuiteData(0, 0.0)
        } else {
            Measure(data: data)
            // If we've run too few iterations, we continue for another second.
            if (data.getOrThrow().runs < benchmark.minIterations) {
                return data
            }
            let usec = Float64(data.getOrThrow().elapsed * 1_000.0) / Float64(data.getOrThrow().runs)
            // let latencySamples = (benchmark.latencyResult.isSome()) ? benchmark.latencyResult.getOrThrow()() : [0]
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

    // Computes the average of the worst samples. For example, if percentile is 99, this will report the
    // average of the worst 1% of the samples.
    func averageAbovePercentile(numbers: ArrayList<Float64>, percentile: Float64): Float64 {
        var numbersCopy = numbers
        numbersCopy.sort()

        // Now the elements we want are at the end. Keep removing them until the array size shrinks too much.
        // Examples assuming percentile = 99:
        //
        // - numbers.length starts at 100: we will remove just the worst entry and then not remove anymore,
        //   since then numbers.length / originalLength = 0.99.
        //
        // - numbers.length starts at 1000: we will remove the ten worst.
        //
        // - numbers.length starts at 10: we will remove just the worst.
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
        // Do a sanity check.
        if (!numbersCopy.isEmpty() && result < numbersCopy[numbersCopy.size - 1]) {
            return result
        }
        return result
    }

    // Converts a score value to a string with at least three significant
    // digits.
    static func formatScore(value: Float64): String {
        if (value > 100.0) {
            return value.toString()
        } else {
            return value.toString()
        }
    }

    // Notifies the runner that we're done running a single benchmark in
    // the benchmark suite. This can be useful to report progress.
    func notifyStep(result: BenchmarkResult) {
        this.results.add(result)
        if (this.runner.getOrThrow().notifyStep is ((String) -> Unit)) {
            this.runner.getOrThrow().notifyStep(result.benchmark.name)
        }
    }

    // Notifies the runner that running a benchmark resulted in an error.
    func notifyError(error: String) {
        if (this.runner.isSome()) {
            runner.getOrThrow().notifyError(this.name, error)
        }
        if (this.runner.isSome()) {
            runner.getOrThrow().notifyStep(this.name)
        }
    }
}

/**
 * Constructs a Splay tree.  A splay tree is a self-balancing binary
 * search tree with the additional property that recently accessed
 * elements are quick to access again. It performs basic operations
 * such as insertion, look-up and removal in O(log(n)) amortized time.
 *
 * @constructor
 */
class SplayTree {
    var root_: ?Node = None

    func isEmpty(): Bool {
        return this.root_.isNone()
    }

    /**
     * Inserts a node into the tree with the specified key and value if
     * the tree does not already contain a node with the specified key. If
     * the value is inserted, it becomes the root of the tree.
     *
     * @param {number} key Key to insert into the tree.
     * @param {*} value Value to insert into the tree.
     */
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

    /**
     * Removes a node with the specified key from the tree if the tree
     * contains a node with this key. The removed node is returned. If the
     * key is not found, an exception is thrown.
     *
     * @param {number} key Key to find and remove from the tree.
     * @return {SplayTree.Node} The removed node.
     */
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
            // Splay to make sure that the new root has an empty right child.
            this.splay_(key)
            remove2++
            // Insert the original right child as the right child of the new
            // root.
            this.root_?.right = right
        }

        return removed
    }

    /**
     * Returns the node having the specified key or null if the tree doesn't contain
     * a node with the specified key.
     *
     * @param {number} key Key to find in the tree.
     * @return {SplayTree.Node} Node having the specified key.
     */
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

    /**
     * @return {SplayTree.Node} Node having the maximum key value.
     */
    func findMax(opt_startNode!: ?Node = Option<Node>.None): ?Node {
        if (this.isEmpty()) {
            return None
        }
        var current: ?Node = opt_startNode ?? this.root_
        // if (opt_startNode.isSome()) {
        //     current = opt_startNode
        // } else {
        //     current = this.root_
        // }

        while (current.getOrThrow().right.isSome()) {
            current = current.getOrThrow().right
        }
        return current
    }

    /**
     * @return {SplayTree.Node} Node having the maximum key value that
     *     is less than the specified key value.
     */
    func findGreatestLessThan(key: Float64): ?Node {
        if (this.isEmpty()) {
            return None
        }
        // Splay on the key to move the node with the given key or the last
        // node on the search path to the top of the tree.
        this.splay_(key)
        findGreatestLessThanTime++
        // Now the result is either the root node or the greatest node in
        // the left subtree.
        if (this.root_.getOrThrow().key.getOrThrow() < key) {
            return this.root_
        } else if (this.root_.getOrThrow().left.isSome()) {
            return this.findMax(opt_startNode: this.root_.getOrThrow().left)
        } else {
            return None
        }
    }

    /**
     * @return {Array<*>} An array containing all the keys of tree's nodes.
     */
    func exportKeys(): ArrayList<Float64> {
        let result = ArrayList<Float64>([])
        if (!this.isEmpty()) {
            this.root_.getOrThrow().traverse_({node: Node => result.add((node.key).getOrThrow())})
        }
        return result
    }

    /**
     * Perform the splay operation for the given key. Moves the node with
     * the given key to the top of the tree.  If no node has the given
     * key, the last node on the search path is moved to the top of the
     * tree. This is the simplified top-down splaying algorithm from:
     * "Self-adjusting Binary Search Trees" by Sleator and Tarjan
     *
     * @param {number} key Key to splay the tree on.
     * @private
     */
    func splay_(key: Float64) {
        insertNode++
        if (this.isEmpty()) {
            return
        }
        // Create a dummy node.  The use of the dummy node is a bit
        // counter-intuitive: The right child of the dummy node will hold
        // the L tree of the algorithm.  The left child of the dummy node
        // will hold the R tree of the algorithm.  Using a dummy node, left
        // and right will always be nodes and we avoid special cases.
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
                    // Rotate right.
                    let tmp: Node = (current.left).getOrThrow()
                    current.left = tmp.right
                    tmp.right = current
                    current = tmp
                    if (current.left.isNone()) {
                        break
                    }
                }
                // Link right.
                right.getOrThrow().left = current
                right = current
                current = current.left.getOrThrow()
            } else if (key > current.key.getOrThrow()) {
                if (current.right.isNone()) {
                    break
                }
                if (key > (current.right.getOrThrow().key ?? 0.0)) {
                    // Rotate left.
                    let tmp: Node = current.right.getOrThrow()
                    current.right = tmp.left
                    tmp.left = current
                    current = tmp
                    if (current.right.isNone()) {
                        break
                    }
                }
                // Link left.
                left.getOrThrow().right = current
                left = current
                current = current.right.getOrThrow()
            } else {
                break
            }
        }
        // Assemble.
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
    var value: Object // Todo TS value | two types
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
        // The benchmark framework guarantees that Math.random is
        // deterministic; see base.js.
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
        // Insert new node with a unique key.
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
        // Replace a few nodes in the splay tree.
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
        // Allow the garbage collector to reclaim the memory
        // used by the splay tree no matter how we exit the
        // tear down function.
        let keys: ArrayList<Float64> = splayTree.getOrThrow().exportKeys()
        splayTree = Option<SplayTree>.None
        splaySamples = ArrayList<Float64>([])
        // Verify that the splay tree has the right size.
        let length = keys.size
        if (length != kSplayTreeSize) {
            return
        }

        // Verify that the splay tree has sorted, unique keys.
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
    // println("insertNode is ${insertNode}")
    // println("insertTime is ${insertTime}")
    // println("remove1 is ${remove1}")
    // println("remove2 is ${remove2}")
    // println("findTime is ${findTime}")
    // println("findGreatestLessThanTime is ${findGreatestLessThanTime}")
    // println("runTime is ${runTime}")
    //sleep(Duration.second * 10)
}
