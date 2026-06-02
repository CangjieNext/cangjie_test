/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Data<T1> {
    public let a: T1
    public init(x: T1) {
        a = x
    }
}

main() {
    var a: Int64 = 2
    let data: Data<Int32> = Data<Int32>(a)
    return 0
}
// ASSERT: scan sema_mismatched_types
