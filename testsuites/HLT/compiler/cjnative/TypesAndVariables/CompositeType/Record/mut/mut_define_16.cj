/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %compile_lib_opt %f

struct R {
    public var a = 3
    mut operator func [](b: Int64): Int64 {
        this.a = b
        return this.a
    }
}

main() {
    var r = R()
    let a = r[1]
    return a - 1
}
