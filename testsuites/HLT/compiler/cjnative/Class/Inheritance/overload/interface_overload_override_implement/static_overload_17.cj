/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class Super {
    var a = 1
}

class Base <: Super {
    init() {
        a = 2
    }
}

interface Data2 {
    func foo(a: Int64): Base {
        return Base()
    }
}

class Data3 <: Data2 {
    public func foo(a: Int64): Super {
        return Super()
    }
}

main(): Int64 {
    var a = Data3().foo(1).a
    return Int64(a - 2)
}
// ASSERT: scan sema_return_type_incompatible
