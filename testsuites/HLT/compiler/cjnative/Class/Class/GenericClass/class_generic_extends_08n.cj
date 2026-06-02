/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base<T> {
    public var b: Int32 = 4
}

class Data<T> <: Base {
    public var a: Int32 = 2
}

main(): Int32 {
    var data: Data<Int32> = Data<Int32>()
    return 0
}
// ASSERT: scan sema_generic_type_without_type_argument
