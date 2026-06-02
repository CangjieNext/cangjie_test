/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench --no-color | compare %f
// ASSERT: scan PASSED: 7
// ASSERT: scan-not Exception
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

let WARMUP_ITERATIONS = 10
var counter: Float64 = 0.0
var callsCounter: Int64 = 0 // count of calls in a batch

var batches = 0 // count only non-warmup measurements 

var check: () -> Bool = {=> true}

class TestMeasurement <: Measurement {
    public func setup() {
        callsCounter = 0
    }

    public func measure(): Float64 {
        @Assert(check())
        
        if (callsCounter != 0) {
            // count measure as batch only if bench function was called before (non-lambda-overhead measurement)
            batches++
            callsCounter = 0
        }

        counter
    }
}

@Test
@Measure[TestMeasurement()]
@Configure[warmup: WARMUP_ITERATIONS, minDuration: 0.5 * Duration.second]
class FooTest {
    @AfterEach
    func afterEach() {
        println("batches = ${batches}")
        batches = 0
        counter = 0.0
    }

    @Bench
    @Configure[batchSize: 1]
    func testBatch1_1(): Unit {
        counter += 2.0
        callsCounter += 1
        check = {=> callsCounter <= 1}
        sleep(Duration.millisecond * 10)
    }

    @Bench[config.batchSize in [ 1 ]]
    func testBatch1_2(): Unit {
        counter += 2.0
        callsCounter += 1
        check = {=> callsCounter <= 1}
        sleep(Duration.millisecond * 10)
    }

    @Bench
    @Configure[baseline: "testBatch1_1", batchSize: 2]
    func testBatch2(): Unit {
        counter += 1.0
        callsCounter += 1
        check = {=> callsCounter == 2 || callsCounter == 0}
        sleep(Duration.millisecond * 10)
    }

    @Bench
    @Configure[batchSize: 3..6]
    func test3(): Unit {
        counter += 2.0
        callsCounter += 1
        check = {=> callsCounter <= 6 && (callsCounter >= 3 || callsCounter == 0)}
        sleep(Duration.millisecond * 10)
    }

    @Bench
    @Configure[baseline: "test3", minBatches: 100, minDuration: Duration.second * 2]
    func test4(): Unit {
        counter += 1.0
        callsCounter += 1
        check = {=> callsCounter <= 4}
        sleep(Duration.millisecond * 10)
    }
}

class TestMeasurement2 <: Measurement {
    public func setup() {
        callsCounter = 0
    }

    public func measure(): Float64 {
        Float64(callsCounter)
    }
}
 
class CheckBatchInputProvider <: BenchInputProvider<Unit> {
    static let BATCH_SIZE = 5
    var batchCounter = 0

    public func reset(batchSize: Int64) {
        if (batchSize == BATCH_SIZE) {
            batchCounter += 1
        }
        @Assert(batchSize == 0 || batchSize == BATCH_SIZE)
    }

    public func get(i: Int64) {}
}

let checker = CheckBatchInputProvider()

@Test
@Measure[TestMeasurement2()]
class StrategyTest {
    @Bench[x in [ checker ]]
    @Configure[minBatches: 20, batchSize: CheckBatchInputProvider.BATCH_SIZE, warmup: 10, minDuration: 0.5*Duration.second]
    func test5(x: Unit) {
        callsCounter+=1
        sleep(10 * Duration.millisecond)
    }

    @Bench[x in [ checker ]]
    @Configure[minBatches: 20, batchSize: CheckBatchInputProvider.BATCH_SIZE, warmup: 10, minDuration: Duration.Zero]
    func test6(x: Unit) {
        callsCounter+=1
        sleep(10 * Duration.millisecond)
    }

    @AfterEach
    func check(name: String) {
        @Expect(checker.batchCounter, 34)
        checker.batchCounter = 0
    }
}
