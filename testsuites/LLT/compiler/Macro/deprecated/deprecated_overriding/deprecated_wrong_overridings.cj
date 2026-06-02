// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan overridden function 'foo' should be marked with @Deprecated

open class Base {
    @Deprecated[strict: true]
    public open func foo() {}

    @Deprecated[strict: true]
    public open func boo() {}
}

class Inheritor <: Base {
    public func foo() {}

    @Deprecated[strict: false]
    public func boo() {}
}

main() {}


