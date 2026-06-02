// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan function 'foo1' is deprecated.
// ASSERT: scan variable 'b' is deprecated since 1999.
// ASSERT: scan function 'foo2' is deprecated.
// ASSERT: scan variable 'str' is deprecated.
// ASSERT: scan property 'property1' is deprecated.
// ASSERT: scan property setter of 'property2' is deprecated since 2222.
// ASSERT: scan unused expression

class Class {
    @Deprecated
    static func foo1() {}

    @Deprecated[since: "1999"]
    static var b: Bool = false
}

struct Struct {
    @Deprecated
    public static func foo2() {}

    @Deprecated
    static let str: String = "fsg"

    @Deprecated
    static prop property1: Bool {
        get() {
            false
        }
    }

    mut static prop property2: Bool {
        get() {
            false
        }
        @Deprecated[since: "2222"]
        set(_) {
        }
    }
}

main(): Unit {
    Class.foo1()
    Class.b

    Struct.foo2()
    Struct.str

    Struct.property1
    let _ = Struct.property2
    Struct.property2 = false
}

