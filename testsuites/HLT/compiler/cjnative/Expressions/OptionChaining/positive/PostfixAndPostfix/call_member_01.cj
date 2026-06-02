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
class A {
    let c: Int64
    init(x: Int64) {
        this.c = x
    }
}

let f: (Int64) -> Option<A> = {i => Some(A(i))}

main() {
    let a = Some(f)
    var b = 200
    var e = a?(b)?.c
    if ((e ?? -1) != 200) {
        return 1
    }
    return 0
}
