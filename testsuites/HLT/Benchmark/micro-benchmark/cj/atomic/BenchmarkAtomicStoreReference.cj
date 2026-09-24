/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 3
// EXEC: %compiler %cmp_opt -O2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color
import std.sync.*
import std.time.*
import std.runtime.*
import std.unittest.*
class A {
    var num: Int32 = 0
    init(num: Int32) {
        this.num = num
    }
}

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_AtomicStoreReference {

    @Strategy
    func atomicData(): GenerateEachInputProvider<(AtomicReference<A>, A)> {
        GenerateEachInputProvider {
            let test = AtomicReference<A>(A(1))
            let a = A(2)
            (test, a)
        }
    }

    @Bench[data in atomicData]
    func BenchmarkAtomicStoreReference(data: (AtomicReference<A>, A)): Unit {
        blackBox(data[0].store(data[1]))
    }
}
