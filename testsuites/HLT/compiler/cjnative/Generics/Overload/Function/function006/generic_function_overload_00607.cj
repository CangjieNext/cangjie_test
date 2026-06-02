/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Base {}

class Sub <: Base {}

func test<X, Y>(a: X, b: Y) {
    return 1
}

func test<X>(a: Base, b: X) where X <: Sub {
    return 2
}

func test<X>(a: Base, b: X) where X <: Base {
    return 3
}

main(): Int64 {
    var I = test<Sub>(Base(), Sub())
    if (I != 2) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_overload_conflicts
