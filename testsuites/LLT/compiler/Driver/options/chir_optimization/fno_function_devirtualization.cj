// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt -O2 --fno-chir-devirtualization %f -o %output 2>&1 | compare %f
//  ASSERT: scan-not was optimized by the opt Devirtualization

open class A {
    protected open func Foo() {
        return 1
    }
    protected open func Bar() {
        return 2
    }
}

open class B <: A {
    // open function, can be overridden again
    protected open override func Foo() {
        return 10
    }
}

open class C <: B {
    protected open override func Foo() {
        return 20
    }
}

main() {
    let a: B = C();
    return a.Foo() - 20;
}
