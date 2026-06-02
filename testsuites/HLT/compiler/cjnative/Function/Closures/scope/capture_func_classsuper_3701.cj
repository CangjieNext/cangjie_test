/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var res: Int32 = 0

open class Boo {
    public var a: Int32 = 1
    public let b: Int32 = 1
}

class Aoo <: Boo {
    public static var c = if (true) {
        func foo3() {
            return a
        } // EXPECPTED: regex 'a' is non-static member, cannot be accessed by static function 'foo3'
    }
}

main(): Int64 {
    var a = Aoo()
    if (res != 10) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_static_function_cannot_access_non_static_member
