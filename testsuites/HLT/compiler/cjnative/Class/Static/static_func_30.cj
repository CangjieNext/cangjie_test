/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

interface I {
    static func coo<V>(x: V): V {
        return x
    }
}

class Test <: I {}

func run(): Int64 {
    var res1: String = Test.coo<String>("hi");
    if (res1 != "hi") {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
