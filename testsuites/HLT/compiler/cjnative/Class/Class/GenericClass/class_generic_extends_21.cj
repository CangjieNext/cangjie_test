/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

open class Base<T> {
    public static var a: Int32 = 2
}

class Data<T> <: Base<T> {
    public var a: Int32 = 3
}

main(): Int64 {
    var base: Base<Int32> = Base<Int32>()
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = data.a
    if (res == 3) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
