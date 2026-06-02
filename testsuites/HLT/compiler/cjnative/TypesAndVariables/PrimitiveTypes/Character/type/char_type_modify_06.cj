/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1

open class A {
    protected var c: Rune = r'a'
}

class SubB <: A {
    public var newChar: Rune
    public init() {
        newChar = c
    }
}

func run(): Int64 {
    var res = SubB().newChar
    if (res == r'a') {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
