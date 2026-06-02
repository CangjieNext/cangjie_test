// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

@Annotation
public class Custom {
    public const Custom(
        let b: B
    ) {}
}

public struct A {
    public const A() {}

@!Custom[B()]
    prop bar: Int {
        get() {3}
    }
}
public class B {
    public const B() {}
}
main() {}

/* SCAN
_CN7default1A3barE:
    Custom{"b": B{}}
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
