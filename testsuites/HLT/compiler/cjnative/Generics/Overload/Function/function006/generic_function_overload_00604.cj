/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Base {}

func test<X, Y>(a: X, b: Y) {
    return 1
}

func test<X>(a: Base, b: X) {
    return 2
}

main(): Int64 {
    var I = test<Int64>(Base(), 1)
    if (I != 2) {
        return 1
    }
    return 0
}
