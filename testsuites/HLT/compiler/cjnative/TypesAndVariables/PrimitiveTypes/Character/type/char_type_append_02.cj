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
    operator func +(b: T): String
}

extend Rune <: Add<Rune> {
    public operator func +(b: Rune): String {
        return (this.toString() + b.toString() + "!")
    }
}

var c1 = r'a'
var c2 = r'b'

func run(): Int64 {
    var res1 = c1 + c2
    if (res1 == "ab!") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
