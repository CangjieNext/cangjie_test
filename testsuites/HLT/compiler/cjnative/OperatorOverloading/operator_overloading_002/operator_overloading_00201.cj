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

struct R {
    public R(let r: Array<Int32>) {}
    public operator func [](inputB: Int32): Int32 {
        return this.r[Int64(inputB)]
    }
    public operator func [](inputB: Int64): Int32 {
        return this.r[inputB]
    }
    public operator func [](inputB: R): Bool {
        return true
    }
}

class C {
    public let c: Array<Int32>
    public operator func [](inputB: Int32): Int32 {
        return this.c[Int64(inputB)]
    }
    public operator func [](inputB: Int64): Int32 {
        return this.c[inputB]
    }
    public operator func [](inputB: C): Bool {
        return true
    }
    public init(a: Array<Int32>) {
        this.c = a
    }
}

main(): Int64 {
    let r1 = R([Int32(1)])
    let r2 = R([Int32(-1)])
    let c1 = C([Int32(2)])
    let c2 = C([Int32(-2)])
    var i_32: Int32 = 0
    var i_64: Int64 = 0
    var res1 = r1[i_32]
    var res2 = r2[i_64]
    var res3 = c1[i_32]
    var res4 = c2[i_64]
    if (res1 == 1 && res2 == -1 && res3 == 2 && res4 == -2 && r1[r2] && c1[c2] && r2[r1] && c2[c1]) {
        return 0
    }
    return 1
}
