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
// TIMEOUT: 1800

import std.random.Random
import std.sort.*
import std.time.*

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Array_Unstable_Sort {
    static let seed : UInt64 = 0x1234 // not used this time

    static let r = Random()

    @Strategy[len in [32, 256, 2048, 16384, 131072/* , 1048576 */]]
    func arrayStrategyD1(len: Int64): GenerateEachInputProvider<Array<Int64>>{
        let arr = Array<Int64>(len, {i => r.nextInt64()})
        GenerateEachInputProvider{ =>
            for (i in 0..arr.size) {
                arr[i] = r.nextInt64()
            }
            arr
        }
    }

    @Strategy[len in [32, 256, 2048]]
    func arrayStrategyD2(len: Int64): GenerateEachInputProvider<Array<Array<Int64>>> {
        let arr = Array<Array<Int64>>(len, {i => Array<Int64>(len, {i => r.nextInt64()})})
        GenerateEachInputProvider{ =>
            for (i in 0..arr.size) {
                for (j in 0..arr.size) {
                    arr[i][j] = r.nextInt64()
                }
            }
            arr
        }
    }

    @Strategy[len in [32, 256]]
    func arrayStrategyD3(len: Int64): GenerateEachInputProvider<Array<Array<Array<Int64>>>> {
        let arr = Array<Array<Array<Int64>>>(len, {i => Array<Array<Int64>>(len, {i => Array<Int64>(len, {i => r.nextInt64()})})})
        GenerateEachInputProvider{ =>
            for (i in 0..arr.size) {
                for (j in 0..arr.size) {
                    for (k in 0..arr.size) {
                        arr[i][j][k] = r.nextInt64()
                    }
                }
            }
            arr
        }
    }

    @Bench[x in arrayStrategyD1]
    func BenchmarkArrayUnstableSortD1_N(x: Array<Int64>): Unit {
        x.sort(stable: false)
    }

    @Bench[x in arrayStrategyD2]
    func BenchmarkArrayUnstableSortD2_N(x: Array<Array<Int64>>): Unit {
        for (i in 0..x.size) {
            x[i].sort(stable: false)
        } 
    }

    @Bench[x in arrayStrategyD3]
    func BenchmarkArrayUnstableSortD3_N(x: Array<Array<Array<Int64>>>): Unit {
        for (i in 0..x.size) {
            for (j in 0..x.size) {
                x[i][j].sort(stable: false)
            }
        } 
    }

}
