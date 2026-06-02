// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableO2 %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not unused expression

func foo(a: Bool, b: Bool) {
    match ((a, b)) {
        case (true, true) => ()
        case (true, false) => ()
        case (false, true) => ()
        case (false, false) => ()
    }
}

main() {
    0
}