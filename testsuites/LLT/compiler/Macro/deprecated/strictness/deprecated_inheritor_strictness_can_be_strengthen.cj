// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f

@Deprecated
open class A {}

@Deprecated[strict: true]
class B <: A {}

@Deprecated
class B2 <: A {
    B2() {}

    init(_: Bool) {}
}

@Deprecated
interface AI {}

@Deprecated[strict: true]
interface BI <: AI {}

open class AA {
    @Deprecated
    public open func foo() {}
}

class BB <: AA {
    @Deprecated[strict: true]
    public func foo() {}
}

main(): Unit {}
