/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Father {
    public func foo(a: Int8): Int64 {
        return 1
    }
}

class Child <: Father {
    private func foo(a: Int16): Int64 {
        return 2
    }
}

main() {
    var i = Child()
    if (i.foo(Int16(1)) != Int64(2)) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_mismatched_types
