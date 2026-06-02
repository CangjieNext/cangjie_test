/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type fun = ((Array<Float32>) -> Float32) -> String

enum enumA<T> where T <: fun {
    | A

    public func a(a: T) {
        a
    }
    public static func b(a: T): T {
        a
    }
}

func c(a: Array<Float32>) {
    if (a.size < 1) {
        return Float32(0.0)
    } else {
        return a[a.size - 1]
    }
}

func d(a: (Array<Float32>) -> Float32) {
    return a([1.0f32, 2.0f32, 3.0f32, 4.0f32]).toString()
}

main(): Int64 {
    var a: String = enumA<fun>.b(d)(c)
    var b: String = enumA<fun>.A.a(d)(c)
    if (a == "4.000000" && b == "4.000000") {
        return 0
    } else {
        return 1
    }
}

// ASSERT: scan sema_upper_bound_must_be_class_or_interface
