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

type A<T, K> = enumA<T, K>

enum enumA<T, K> {
    C(T) | B(K)
}

struct B {}

extend B {
    public func a(a: A<Int64, Float64>) {
        var b: Int64 = match (a) {
            case C(x) => x
            case _ => 2
        }
        var d: Float64 = match (a) {
            case B(x) => x
            case _ => 3.002
        }

        return b + Int64(d)
    }
}

main(): Int64 {
    if (B().a(A.B(5.003)) == 7) {
        return 0
    } else {
        return 1
    }
}
