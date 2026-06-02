/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

abstract class Base {
    public static let test: Array<Bool> = []
}

class Data <: Base {}

main(): Int64 {
    Data.test = [true]
    if (Data.test[0]) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
