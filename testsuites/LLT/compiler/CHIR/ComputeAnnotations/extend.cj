// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

@Annotation
public class Custom {
    public const Custom(
        let b: B
    ) {}
}

public struct A {
    public const A() {}
}
public class B {
    public const B() {}
}
extend A {
@!Custom[B()]
    public func toString() { "B"}
}
extend B <: ToString {
@!Custom[B()]
    public func toString() { "B"}
}
main() {}

/* SCAN
_CN7defaultXRNY_1AE8toStringHv:
    Custom{"b": B{}}
_CN7defaultXCNY_1BE8toStringHv:
    Custom{"b": B{}}
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
