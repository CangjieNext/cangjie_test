/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench --no-color | compare %f
// ASSERT: scan PASSED: 1


var x = -1
var o = Finalizer()

var firstInvocation = true

class Finalizer {
    Finalizer() {
        x += 1
    }

    ~init() {
        x -= 1
    }
}

@Strategy[repeat in 0..3]
func checkFin(repeat: Int64): Unit {
    firstInvocation = true
}

@Test
class Fin {
    @Bench[q in checkFin]
    @Configure[warmup: 100, minDuration: Duration.second*0.2, explicitGC: Heavy]
    func foo(q: Unit) {
        if (firstInvocation) {
            firstInvocation = false
            @Expect(x == 0)
        }
        o = Finalizer()
    }
}