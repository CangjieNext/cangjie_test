/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

struct Data<T1> {
    public func getX(x: T1): T1 {
        return x
    }
}

main() {
    var i: Int32 = 4
    let x: Int64 = Data<Int32>().getX(i)
    return 0
}
// ASSERT: scan sema_mismatched_types
