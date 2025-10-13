// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

@!A[C2(3).foo()]
@!A[C3(888).foo()]
func foo() {}

@Annotation
public class A {
    public const A(let a: Int) {}
}

public interface C1 {
    const func foo() {
        1083
    }
}
public class C2 <: C1 {
    public const C2(let a: Int) {}
}
public class C3 <: C1 {
    public const C3(let a: Int) {}
    public const func foo() {
        a
    }
}

main() {}

/* SCAN
_CN7default3fooHv:
    A{"a": 1083}
    A{"a": 888}
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
