/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

class Aoo<T> where T <: String {
    public var a: T
    public init(x: T) {
        a = x
    }
}

class Boo<T> where T <: Array<Int32> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

main() {
    var a1 = Aoo<String>("a")
    if (a1.a != "a") {
        return 1
    }
    var a2 = Boo<Array<Int32>>([1, 2, 3])
    if (a2.a[1] != 2) {
        return 2
    }
    return 0
}
