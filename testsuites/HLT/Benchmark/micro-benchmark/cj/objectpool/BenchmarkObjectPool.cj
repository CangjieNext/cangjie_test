/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --reportFormat=xml --reportPath=./tmpfile
// TIMEOUT: 3600

import std.unittest.*
import std.unittest.testmacro.*
import std.runtime.*
import std.runtime
import std.sync.*
import std.time.*
import std.collection.ArrayList
import std.objectpool.*

let R = 100
let repeatN = 1

class A {
    public let arr: Array<UInt8>
    let size: Int64

    init(size: Int64) {
        this.arr = Array(size, repeat: 0)
        this.size = size
    }

    public func reset() {
        arr[0..size].fill(0)
        this
    }

    public static func new(size: Int64) {
        A(size)
    }
}

@Test
class PoolTester {
    @TestCase[arrSize in [ 128, 1024, 1024 * 64 ], T in [ 1, 4, 8, 16, 32, 64, 128 ], SU in [ 1, 10 ]]
    func testNoPool(arrSize: Int64, T: Int64, SU: Int64) {
        let pool = ObjectPool<A>({=> A(arrSize)})
        let helper = PoolTestHelper(pool, false, arrSize, {=> A(arrSize)})

        var realR = R
        // find proper R
        while (true) {
            runtime.GC()

            let startTime = DateTime.now()
            helper.test(T, realR, SU)
            let t = Float64((DateTime.now() - startTime).toNanoseconds()) / 1e9
            if (t < 1.0) {
                realR *= 10
                continue
            }
            realR = Int64(Float64(realR) / t * 1.0)
            break
        }
        sleep(Duration.second)

        let tmpR = realR
        let scores = ArrayList<Float64>()

        // start test
        for (_ in 0..repeatN) {
            runtime.GC(heavy: true)
            let before = TimeNow().measure()
            helper.test(T, tmpR, SU)
            let t = TimeNow().measure() - before
            let score = t / (Float64(T * tmpR * SU))
            println("BenchmarkNoObjectPoolS${arrSize}_T${T}_SU${SU}: ${score} ns/op")
        }
    }

    @TestCase[arrSize in [ 128, 1024, 1024 * 64 ], T in [ 1, 4, 8, 16, 32, 64, 128 ], SU in [ 1, 10 ]]
    func testPoolNoZeroing(arrSize: Int64, T: Int64, SU: Int64) {
        let pool = ObjectPool<A>({=> A(arrSize)})
        let helper = PoolTestHelper(pool, true, arrSize, {=> A(arrSize)})

        var realR = R
        // find proper R
        while (true) {
            runtime.GC()

            let startTime = DateTime.now()
            helper.test(T, realR, SU)
            let t = Float64((DateTime.now() - startTime).toNanoseconds()) / 1e9
            if (t < 1.0) {
                realR *= 10
                continue
            }
            realR = Int64(Float64(realR) / t * 1.0)
            break
        }
        sleep(Duration.second)

        let tmpR = realR
        let scores = ArrayList<Float64>()

        for (_ in 0..repeatN) {
            runtime.GC(heavy: true)
            let before = TimeNow().measure()
            helper.test(T, tmpR, SU)
            let t = TimeNow().measure() - before
            let score = t / (Float64(T * tmpR * SU))
            println("BenchmarkObjectPoolS${arrSize}_T${T}_SU${SU}: ${score} ns/op")
        }
    }

    @TestCase[arrSize in [ 128, 1024, 1024 * 64 ], T in [ 1, 4, 8, 16, 32, 64, 128 ], SU in [ 1, 10 ]]
    func testPoolZeroing(arrSize: Int64, T: Int64, SU: Int64) {
        let pool = ObjectPool<A>({=> A(arrSize)})
        let helper = PoolTestHelper(pool, true, arrSize, {=> A(arrSize)})

        var realR = R
        // find proper R
        while (true) {
            runtime.GC()

            let startTime = DateTime.now()
            helper.test(T, realR, SU)
            let t = Float64((DateTime.now() - startTime).toNanoseconds()) / 1e9
            if (t < 1.0) {
                realR *= 10
                continue
            }
            realR = Int64(Float64(realR) / t * 1.0)
            break
        }
        sleep(Duration.second)

        let tmpR = realR
        let scores = ArrayList<Float64>()

        for (_ in 0..repeatN) {
            runtime.GC(heavy: true)
            let before = TimeNow().measure()
            helper.test(T, tmpR, SU)
            let t = TimeNow().measure() - before
            let score = t / (Float64(T * tmpR * SU))
            println("BenchmarkObjectPoolZeroingS${arrSize}_T${T}_SU${SU}: ${score} ns/op")
        }
    }
}

class PoolTestHelper<T> where T <: Object {
    let usePool: Bool

    let pool: ObjectPool<T>
    let arraySize: Int64
    let newFunc: () -> T
    let futures: ArrayList<Future<Unit>>

    init(pool: ObjectPool<T>, usePool: Bool, arraySize: Int64, newFunc: () -> T) {
        this.pool = pool

        this.usePool = usePool

        this.arraySize = arraySize
        this.newFunc = newFunc

        this.futures = ArrayList<Future<Unit>>()
    }

    public func extractElement(): T {
        if (usePool) {
            pool.get()
        } else {
            this.newFunc()
        }
    }

    public func returnElement(elem: T) {
        if (usePool) {
            pool.put(elem)
        } else {
            return
        }
    }

    public func test(NThreads: Int64, R: Int64, SU: Int64) {
        let counter = SyncCounter(NThreads)
        let stub = newFunc()

        for (_ in 0..NThreads) {
            let fut = spawn {
                let storage = Array<T>(SU, repeat: stub)

                counter.dec()
                counter.waitUntilZero()

                for (r in 0..R) {
                    for (j in 0..SU) {
                        storage[j] = extractElement()
                    }

                    for (j in 0..SU) {
                        returnElement(storage[j])
                        storage[j] = stub
                    }
                }
            }

            futures.add(fut)
        }
        for (fut in futures) {
            fut.get()
        }
        futures.clear()
    }
}
