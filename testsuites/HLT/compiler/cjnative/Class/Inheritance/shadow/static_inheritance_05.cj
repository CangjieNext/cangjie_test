/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    private static var test: Array<Bool> = [true]
}

class Data <: Base {
    public static var data: Array<Bool> = test
}

main(): Int64 {
    Data.test
    return 1
}
// ASSERT: scan sema_invalid_access_control
