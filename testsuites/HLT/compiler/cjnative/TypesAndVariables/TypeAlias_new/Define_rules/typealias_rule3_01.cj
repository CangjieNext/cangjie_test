/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

class classA<T> {
    public func a(x: T) {
        x
    }
}

type A<T, V> = classA<T>

main(): Int64 {
    var a: A<Int64, String> = classA<Int64>()
    if (a.a(1) == 1) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan typealias_unused_type_parameters
