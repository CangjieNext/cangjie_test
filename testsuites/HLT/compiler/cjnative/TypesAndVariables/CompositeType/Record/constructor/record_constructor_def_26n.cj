/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return run()
}

struct Data<T> {
    let width2: T
    let length2: T

    init(width: T, length: T) {
        width2 = width
    }

    func area(): T {
        return width2
    }
}

func run(): Int64 {
    var a: Int64 = 3
    var b: Int64 = 4
    let data: Data<Int64> = Data<Int64>(a, b)
    return 0
}
// ASSERT: scan sema_class_uninitialized_field
