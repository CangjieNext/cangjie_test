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
    let width: T
    let length: T = width
    init(widthin: T, lengthin: T) {
        width = widthin
    }
    func area(): T {
        return length
    }
}

func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data<Int32> = Data<Int32>(a, b)
    res = data.area()
    return 0
}
// ASSERT: scan sema_used_before_initialization
