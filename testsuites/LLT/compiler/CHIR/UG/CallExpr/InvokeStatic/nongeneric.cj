// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f %dumpCHIRDebug
// (DEBUG_OPTION)EXEC: compare %f <default_CHIR/0_AST_CHIR.chir

open class A {
    public static func foo() {}
}

open class B <: A {}

main() {
    B.foo() // should be Apply(B, A::foo)
}

// ASSERT: scan Unit = Apply(ThisType: Class-_CN7default1BE&, Class-_CN7default1AE::@_CN7default1A3fooHv : () -> Unit)
