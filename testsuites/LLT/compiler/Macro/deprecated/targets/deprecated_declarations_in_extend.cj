// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan function 'foo1' is deprecated.
// ASSERT: scan function 'foo2' is deprecated since 2034.
// ASSERT: scan property 'property2' is deprecated.
// ASSERT: scan property 'property2' is deprecated.

class Class<T> {}

interface Marker {}

class Marked <: Marker {}

extend<T> Class<T> {
    @Deprecated
    func foo1() {}

    @Deprecated[since: "2034"]
    static func foo2() {}

    @Deprecated
    prop property1: Bool {
        get() {
            false
        }
    }
}

extend<T> Class<T> <: Marker where T <: Marker {
    @Deprecated
    mut prop property2: String {
        get() {
            "fs"
        }
        set(_) {}
    }
}

main(): Unit {
    let c = Class<Marked>()
    c.foo1()
    Class<Bool>.foo2()
    c.property1
    c.property2 = "sdf"
}

