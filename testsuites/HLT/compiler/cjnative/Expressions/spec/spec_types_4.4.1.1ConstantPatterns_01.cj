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

enum Foo {
    Year | Month | Day
}

func f() {
    let x = Foo.Year
    match (x) {
        case Year => 0
        case Month => 1
        case Day => 2
    }
}

main(): Int64 {
    f()
    return 0
}
