/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum A {
    a(Int32) | b(Int32)
}

func test(): Int64 {
    var i: A = A.a(1)
    let j: A = A.a(1)
    var res = match (i) {
        case a: Int32 => 1
        case a => 2
        case b(x) => 3
        case a => 4
        case _ => 5
        case a(x) => 6
    }
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_enum_pattern_param_size_error
