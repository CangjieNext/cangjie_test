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

type A<T> = structA<T>

struct structA<T> {
    public var a: T
    public structA(var x: T) {
        this.a = x
    }
}

class B {
    public static var a: A<Rune> = A<Rune>(r'a')
}

main(): Int64 {
    if (B.a.a == r'a') {
        return 0
    } else {
        return 1
    }
}
