/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class Aoo<T> where T <: B & I {
    public var a: T
    public init(x: T) {
        a = x
    }
}

struct B <: I {
    public var b: Int64 = 1
    public init() {}
}

interface I {}

main() {
    var a = Aoo<B>(B())
    if (a.a.b != 1) {
        return 1
    }
    return 0
}

// ASSERT: scan sema_upper_bound_must_be_class_or_interface
