// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a const function call in ordinary runtime context is not propagated.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

const func currentValue(): Int64 {
    1
}

main() {
    if (currentValue() < 0) {
        println("not diagnosed")
    }
}

/* SCAN
*/
