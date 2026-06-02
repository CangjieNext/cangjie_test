// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan overridden function 'foo' should be marked with @Deprecated

public open class A {
    @Deprecated[strict: true]
    public open func foo() {}
}

public class B <: A {
    public override func foo() {}
}

public open class AA {
    @Deprecated[strict: false]
    public open func foo() {}
}

public class BB <: AA {
    public override func foo() {}
}

main() {}


