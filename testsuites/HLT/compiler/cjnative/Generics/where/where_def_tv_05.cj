/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Aoo<T, V> where T <: V, V <: T {
    public var a: V
    public init(x: V) {
        a = x
    }
}

main() {
    var a = Aoo<Int32, Int32>(1)
    if (a.a != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_generic_param_directly_recursive
