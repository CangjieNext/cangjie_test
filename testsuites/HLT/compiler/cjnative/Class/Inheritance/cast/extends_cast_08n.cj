/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_wrong_number_of_arguments

open class Base {}

class Data <: Base {
    public func foo(): Int32 {
        return 3
    }
}

main(): Int64 {
    var obj: Data = Data(Base())
    var res1: Int32 = obj.foo()
    if (res1 != 3) {
        return 1
    }

    return 0
}
