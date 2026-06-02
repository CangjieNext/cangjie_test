/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface A {
    func test() {
        return 1
    }
}

struct B {}

extend B <: A {}

let emptyArr1: Array<A> = [B()]

main() {
    var res: A = emptyArr1[0]
    return res.test() - 1
}
