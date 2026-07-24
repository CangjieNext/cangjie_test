// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify String operators lowered as Apply do not provide a CHIR constant value.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let lhs = "ab" + ""
    let rhs = "a" + "b"
    if (lhs != rhs) {
        println("must not be diagnosed")
    }
}

/* SCAN
*/
