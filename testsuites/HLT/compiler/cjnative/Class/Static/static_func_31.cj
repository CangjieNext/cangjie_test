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

interface I<T> {
    static func coo<V>(x: T, y: V): V {
        return y
    }
}

class Test<T> <: I<T> {}

func run(): Int64 {
    var res1 = Test<Int32>.coo<String>(3, "hello");
    if (res1 != "hello") {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
