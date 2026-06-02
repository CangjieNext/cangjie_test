/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Aoo<T> where T <: Aoo<T> {
    public var a: B = B()
}

class B <: Aoo<B> {
    public var b: Int64 = 1
}

main() {
    var a = Aoo<B>()
    if (a.a.b != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_recursive_constructor_call
