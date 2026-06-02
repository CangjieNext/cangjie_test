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

interface Add<T> {
    operator func +(b: Int32): T
}

extend String <: Add<String> {
    public operator func +(b: Int32): String {
        return (this + b.toString())
    }
}

var str1 = "Hello Char"
var str2 = "Hello Char Lang"

func run(): Int64 {
    var res1: String = str1 + Int32(2)
    var res2: String = str2 + Int32(3)
    if (res1 == "Hello Char2" && res2 == "Hello Char Lang3") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
