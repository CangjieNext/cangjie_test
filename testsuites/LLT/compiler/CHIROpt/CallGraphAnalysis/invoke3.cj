// EXEC: %compiler %cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default6<main>Hv, DIRECT CALL:_CN7default1C6<init>Hv, VIRTUAL CALL:_CN7default1A3FooHv, VIRTUAL CALL:_CN7default1B3FooHv, VIRTUAL CALL:_CN7default1C3FooHv
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default1A3FooHv
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default1B3FooHv
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default1C3FooHv
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default1C6<init>Hv, DIRECT CALL:_CN7default1B6<init>Hv
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default1B6<init>Hv, DIRECT CALL:_CN7default1A6<init>Hv
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default1A6<init>Hv
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default1A3BarHv

open class A {
    protected open func Foo(){ return 1 }
    protected open func Bar() { return 2 }
}

open class B <: A {
    // open function, can be overridden again
    protected override open func Foo(){ return 10 }
}

open class C <: B {
    protected override open func Foo(){ return 20 }
}

main () {
    let a : B = C();
    return a.Foo() - 20;
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
