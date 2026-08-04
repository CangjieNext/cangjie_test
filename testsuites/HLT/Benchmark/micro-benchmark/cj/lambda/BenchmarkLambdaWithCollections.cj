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


import std.time.*
import std.collection.*
import std.random.Random

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class TestLambdaWithCollections {

    @Strategy[len in [512, 1024, 2048, 4096]]
    func dataStrategy(len: Int64): ArrayList<Int64> {
        ArrayList<Int64>(len, {index: Int64 => index})
    }

    static let r = Random()

    @Strategy[len in [512, 1024, 2048, 4096]]
    func dataStrategyToSort(len: Int64): ArrayList<Int64> {
        ArrayList<Int64>(len, {index: Int64 => r.nextInt64()})
    }

    @Bench[reps in [512, 1024, 2048, 4096]]
    func BenchmarkLambdaWithCollections_ArrayInit_(reps: Int64): Array<Int64> {
        Array<Int64>(reps, {index: Int64 => 2 * index})
    }

    @Bench[reps in [512, 1024, 2048, 4096]]
    func BenchmarkLambdaWithCollections_ArrayListInit_(reps: Int64): ArrayList<Int64> {
        ArrayList<Int64>(reps, {index: Int64 => 2 * index})
    }

    @Bench[data in dataStrategy]
    func BenchmarkLambdaWithCollections_Reduce_(data: ArrayList<Int64>): Int64 {
        reduce({ x: Int64, y: Int64 => x + y })(data).getOrThrow()
    }

    @Bench[data in dataStrategy]
    func BenchmarkLambdaWithCollections_FilterReduce_(data: ArrayList<Int64>): Int64 {
        reduce({ x: Int64, y: Int64 => x + y })(
            filter({ k: Int64 =>
                k % 2 == 1
            })(data)
        ).getOrThrow()
    }

    @Bench[data in dataStrategy]
    func BenchmarkLambdaWithCollections_FilterMapReduce_(data: ArrayList<Int64>): Int64 {
        reduce({ x: Int64, y: Int64 => x + y })(
            map({ k: Int64 => 2 * k })(
                filter({ k: Int64 =>
                    k % 2 == 1
                })(data)
            )
        ).getOrThrow()
    }

    @Bench[data in dataStrategyToSort]
    func BenchmarkLambdaWithCollections_SortBy_(data: ArrayList<Int64>): ArrayList<Int64> {
        data.sortBy(comparator: { x: Int64, y: Int64 =>
            if (x == y) {
                EQ
            } else if (x < y) {
                LT
            } else {
                GT
            }
        })
        data
    }
}
