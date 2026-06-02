/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Data<T> {
    let width2: T
    let length2: T

    Data(width: T, length: T) {
        width2 = width
        length2 = length
    }

    func area(x: Int64): T {
        width2 = x
        return width2
    }
}

main(): Int64 {
    return run()
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data<Int32> = Data<Int32>(a, b)
    var res: Int32
    res = data.area(b)
    if (res == 4) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_cannot_modify_var
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_mismatched_types
