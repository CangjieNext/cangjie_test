/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum A {
    a(Int32)
}

func g<T>(b: T) {
    let a: A = A.a(1)
    var i: Int32 = match (a) {
        case a => 1
        case test => 2
        case a(x) => 3
        case b: Int32 => 4
        case _ => 0
    }
    return 0
}

main() {
    return g<A>(A.a(1))
}
// ASSERT: scan sema_enum_pattern_param_size_error
