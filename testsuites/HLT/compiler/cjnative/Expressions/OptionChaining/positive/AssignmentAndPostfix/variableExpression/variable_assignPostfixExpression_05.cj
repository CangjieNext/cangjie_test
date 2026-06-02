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
let t = [Some(A(200))]

class A {
    var c: Int64
    init(x: Int64) {
        this.c = x
    }
}

main() {
    var a = Some(t)
    a?[0]?.c = 1
    if ((a?[0]?.c ?? -1) != 1) {
        return 1
    }
    return 0
}
