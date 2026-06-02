// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableO2 %debugCHIROpt %cmp_opt %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [RedundantFutureRemoval] The call to Spawn at [14,9] has been optimised due to redundant future in spawn.
// ASSERT: scan [RedundantFutureRemoval] The call to Spawn at [20,12] has been optimised due to redundant future in spawn.

class A {
    public func test<T>(x: T): T {
        spawn {x}
        x
    }
}

main() {
    return A().test(0)
}
