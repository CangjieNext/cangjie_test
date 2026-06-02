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

struct Coo<T> {}

extend<T> Coo<T> {
    public static func foo<V>(x: V): V {
        return x
    }
}

main(): Int64 {
    var i: Int32 = 3
    var res: Int32 = Coo<String>.foo<Int32>(i)
    if (res == 3) {
        return 0
    }
    return 1
}
