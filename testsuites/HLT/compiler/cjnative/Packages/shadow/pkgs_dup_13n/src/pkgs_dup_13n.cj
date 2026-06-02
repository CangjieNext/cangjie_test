/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f pkgs.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs.test

struct Foo {
    public var test: Int32 = 3
    public init(test!: Int32 = 3) {
        this.test = test
    }
}

func run(): Int64 {
    var foo = Foo().test
    if (foo == 3 && test == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
