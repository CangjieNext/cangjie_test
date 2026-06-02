/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class C0 {
    var v1 = 0
    static var v2: Byte = 0
}

main() {
    let c0 = C0()
    c0.v1++
    C0.v2++
    if (c0.v1 != 1 && C0.v2 != 1) {
        return 1
    }
    c0.v1--
    C0.v2--
    if (c0.v1 != 0 && C0.v2 != 0) {
        return 2
    }
    0
}
