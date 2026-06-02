// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan redefined function 'foo' should be marked with @Deprecated

open class A {
    @Deprecated
    public static func foo(): Unit {}
}

class C <: A {
    public static redef func foo(): Unit {}
}

open class AA {
    @Deprecated[strict: true]
    public static func boo(): Unit {}
}

class CC <: AA {
    public static redef func boo(): Unit {}
}

main() {}

