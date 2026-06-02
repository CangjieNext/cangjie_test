/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return 0
}

open class Aoo {
    public static func foo(x: Int64) {
        return Data()
    }
}

class Boo <: Aoo {
    public static redef func foo(x: Int64) {
        return Base()
    }
}

open class Base {}

class Data <: Base {}
// ASSERT: scan sema_return_type_incompatible
