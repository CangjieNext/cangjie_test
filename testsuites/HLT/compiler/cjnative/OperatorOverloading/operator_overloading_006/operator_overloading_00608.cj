/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC: %run %run_opt %output %run_args

class A {}

interface update {
    operator func *(b: Bool): Int32
}

extend Rune <: update {
    public operator func *(b: Bool): Int32 {
        return 0
    }
}

extend A <: update {
    public operator func *(b: Bool): Int32 {
        return 0
    }
}

main(): Int32 {
    var a = A()
    var b: Rune = 'b'
    var c: Bool = true
    return a * c + b * c
}
