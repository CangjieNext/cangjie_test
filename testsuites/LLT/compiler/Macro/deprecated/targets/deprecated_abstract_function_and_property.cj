// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan function 'foo' is deprecated.
// ASSERT: scan variable 'x' is deprecated since 243.
// ASSERT: scan property 'property1' is deprecated.

abstract class AClass {
    @Deprecated
    public func foo(): Unit

    @Deprecated[since: "243"]
    public var x: Bool = false

    @Deprecated
    public prop property1: String
}

main(): Unit {
}

func test(it: AClass) {
    it.foo()
    let _ = it.x
    it.property1
}


