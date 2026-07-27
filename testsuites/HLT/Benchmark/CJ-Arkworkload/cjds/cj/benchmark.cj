/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
import std.time.*

let TIME_DIVISOR: Float64 = 10.0
let VERBOSITY_TWO: Int64 = 2
let VERBOSITY_THREE: Int64 = 3
let AIRCRAFT_NUM: Int64 = 1000
let FRAMES_NUM: Int64 = 18
let EXPECTED_COLLISIONS: Int64 = 1336
let LOOP_TIMES: Int64 = 5
let NUMBER_ONE_THOUSAND: Int64 = 1000

let isDebug: Bool = true
func debugLog(msg: String) {
    if (isDebug) {
        println("${msg}")
    }
}

class NormalError<: Exception {
    init() {
        super()
    }
    init(message: String) {
        super(message)
    }
    protected override func getClassName(): String {
        return "NormalError"
    }
}

class Configuration {
    var verbosity: Int64
    var numAircraft: Int64
    var numFrames: Int64
    var expectedCollisions: Int64
    var exclude: Int64
    
    init(verbosity: Int64, numAircraft: Int64, numFrames: Int64, expectedCollisions: Int64, exclude: Int64) {
        this.verbosity = verbosity
        this.numAircraft = numAircraft
        this.numFrames = numFrames
        this.expectedCollisions = expectedCollisions
        this.exclude = exclude
    }
}

class Result {
    var time: Float64
    var numCollisions: Int64
    var collisions: ArrayList<Collision> = ArrayList<Collision>()
    
    init(time: Float64, numCollisions: Int64) {
        this.time = time
        this.numCollisions = numCollisions
    }
}

func benchmarkImpl(configuration: Configuration) {

    let verbosity = configuration.verbosity
    let numAircraft = configuration.numAircraft
    let numFrames = configuration.numFrames
    let expectedCollisions = configuration.expectedCollisions
    let exclude = configuration.exclude
    let simulator = Simulator(numAircraft)
    let detector = CollisionDetector()
    var lastTime = currentTime()
    var results: ArrayList<Result> = ArrayList<Result>()
    
    for (i in 0..numFrames) {
        let time = Float64(i) / TIME_DIVISOR
        let collisions = detector.handleNewFrame(simulator.simulate(time))
        let before = lastTime
        let after = currentTime()
        lastTime = after
        let result = Result(Float64((after - before).toNanoseconds())/1000000.0, collisions.size)
        if (verbosity >= VERBOSITY_TWO) {
            println("CDJS:" + "${result.time}")
        }
        if (verbosity >= VERBOSITY_THREE) {
            result.collisions = collisions
        }
        results.add(result)
    }
    results = results[exclude..results.size - 1]
    if (verbosity >= 1) {
        for (i in 0..results.size) {
            var string = "Frame" + "${i}" + ": " + "${results[i].time}" + " ms."
            if (results[i].numCollisions > 0) {
                string += " (" + "${results[i].numCollisions}" + " collisions.)"
            }
            println(string)

            if (verbosity >= VERBOSITY_TWO && results[i].collisions.size > 0) {
                let results_collisions_i = results[i].collisions
                let results_collisions = ArrayList<String>(results[i].collisions.size, {j => results_collisions_i[j].toString()})
                println("    Collisions: " + "${results_collisions}")
            }
        }
    }
    // Check results.
    var actualCollisions = 0
    for (result in results) {
        actualCollisions += result.numCollisions
    }

    if (actualCollisions != expectedCollisions) {
        throw NormalError("Bad number of collisions: " + "${actualCollisions}" + " (expected " + "${expectedCollisions}" + ")")
    }
}

func benchmark() {
   benchmarkImpl(Configuration(0, AIRCRAFT_NUM, FRAMES_NUM, EXPECTED_COLLISIONS, 0))
}

/**
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
    /**
     * @Benchmark
     */
    func runIteration() {
        benchmark()
    }
}

func run() {
    let startTime = Timer().getTime()
    let benchmark = Benchmark()
    for (_ in 0..LOOP_TIMES) {
        benchmark.runIteration()
    }
    let endTime = Timer().getTime()
    println("cdjs: ms = " + "${Float64((endTime - startTime).toNanoseconds())/1000000.0}")
}

class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    public func getTime() {
        let time = DateTime.now()
        return time 
    }
}
