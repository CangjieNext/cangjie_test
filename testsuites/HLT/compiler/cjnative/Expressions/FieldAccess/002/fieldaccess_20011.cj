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

extend Int64 {
    func test() {
        0
    }
}

class B {
    var c: ?Int64 = None
}

main() {
    var a: ?Int64 = None
    var b = B()
    var d = 0
    a ?? b.c ?? d
}
