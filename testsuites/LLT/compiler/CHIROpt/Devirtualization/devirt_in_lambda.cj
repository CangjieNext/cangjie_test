// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT:scan [Devirtualization] The function call to next at [15,9] was optimized.

main() {
    let a = [1, 2, 3, 5]
    var sum = 0
    func foo() {
        for (v in a) {
            sum += v
        }
    }
    foo()
}
