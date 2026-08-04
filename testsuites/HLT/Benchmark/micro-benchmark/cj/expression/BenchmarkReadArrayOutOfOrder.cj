/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg --test -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args --bench --no-color


import std.time.*
import std.collection.HashSet

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Read_Array_Out_Of_Order {

    static let arrD1_32 = Array<Int64>(32, {i => i})
    static let arrD1_256 = Array<Int64>(256, {i => i})
    static let arrD1_2048 = Array<Int64>(2048, {i => i})
    static let arrD1_16384 = Array<Int64>(16384, {i => i})
    static let arrD1_131072 = Array<Int64>(131072, {i => i})
    static let arrD1_1048576 = Array<Int64>(1048576, {i => i})
    static let arrD2_32 = Array<Array<Int64>>(32, {i => Array<Int64>(32, {i => i})})
    static let arrD2_256 = Array<Array<Int64>>(256, {i => Array<Int64>(256, {i => i})})
    static let arrD2_2048 = Array<Array<Int64>>(2048, {i => Array<Int64>(2048, {i => i})})
    //static let arrD2_16384 = Array<Array<Int64>>(16384, {i => Array<Int64>(16384, {i => i})})
    static let arrD3_32 = Array<Array<Array<Int64>>>(32, {i => Array<Array<Int64>>(32, {i => Array<Int64>(32, { i => i })})})
    static let arrD3_256 = Array<Array<Array<Int64>>>(256, {i => Array<Array<Int64>>(256, {i => Array<Int64>(256, { i => i })})})

    static let blackhole = HashSet<Int64>()
    static var element = 0

    // This is to disable aggresive optimizations, like DCE and inline
    public override func afterAll(): Unit {
        blackhole.add(element)
    }

    @Bench[arrLen in [32]]
    func BenchmarkReadArrayOutOfOrderD1_N32(arrLen: Int64): Unit {
        for (i in 0..arrLen:64) {
            element = arrD1_32[i]
        }
    }

    @Bench[arrLen in [256]]
    func BenchmarkReadArrayOutOfOrderD1_N256(arrLen: Int64): Unit {
        for (i in 0..arrLen:64) {
            element = arrD1_256[i]
        }
    }

    @Bench[arrLen in [2048]]
    func BenchmarkReadArrayOutOfOrderD1_N2048(arrLen: Int64): Unit {
        for (i in 0..arrLen:64) {
            element = arrD1_2048[i]
        }
    }

    @Bench[arrLen in [16384]]
    func BenchmarkReadArrayOutOfOrderD1_N16384(arrLen: Int64): Unit {
        for (i in 0..arrLen:64) {
            element = arrD1_16384[i]
        }
    }

    @Bench[arrLen in [131072]]
    func BenchmarkReadArrayOutOfOrderD1_N131072(arrLen: Int64): Unit {
        for (i in 0..arrLen:64) {
            element = arrD1_131072[i]
        }
    }

    @Bench[arrLen in [1048576]]
    func BenchmarkReadArrayOutOfOrderD1_N1048576(arrLen: Int64): Unit {
        for (i in 0..arrLen:64) {
            element = arrD1_1048576[i]
        }
    }

    @Bench[arrLen in [32]]
    func BenchmarkReadArrayOutOfOrderD2_N32(arrLen: Int64): Unit {
        for (i in 0..arrLen:64) {
            for (j in 0..arrLen:64) {
                element = arrD2_32[i][j]
            }
        }
    }

    @Bench[arrLen in [256]]
    func BenchmarkReadArrayOutOfOrderD2_N256(arrLen: Int64): Unit {
        for (i in 0..arrLen:64) {
            for (j in 0..arrLen:64) {
                element = arrD2_256[i][j]
            }
        }
    }

    @Bench[arrLen in [2048]]
    func BenchmarkReadArrayOutOfOrderD2_N2048(arrLen: Int64): Unit {
        for (i in 0..arrLen:64) {
            for (j in 0..arrLen:64) {
                element = arrD2_2048[i][j]
            }
        }
    }

    @Bench[arrLen in [32]]
    func BenchmarkReadArrayOutOfOrderD3_N32(arrLen: Int64): Unit {
        for (i in 0..arrLen:64) {
            for (j in 0..arrLen:64) {
                for (k in 0..arrLen:64) {
                    element = arrD3_32[i][j][k]
                }
            }
        }
    }

    @Bench[arrLen in [256]]
    func BenchmarkReadArrayOutOfOrderD3_N256(arrLen: Int64): Unit {
        for (i in 0..arrLen:64) {
            for (j in 0..arrLen:64) {
                for (k in 0..arrLen:64) {
                    element = arrD3_256[i][j][k]
                }
            }
        }
    }

}
