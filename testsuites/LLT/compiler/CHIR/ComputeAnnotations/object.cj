// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

@Annotation
public class CustomAnnotation {
    public const CustomAnnotation(
        let b: B
    ) {}
}

public struct A {
    public const A() {}
}
public class B {
    public const B(let a: A, let c: C) {}
}
public class C {
    public const C() {}
}
@!CustomAnnotation[B(A(), C())]
func foo(
) {}
main() {}

/* SCAN
_CN7default3fooHv:
    CustomAnnotation{"b": B{"a": A{},"c": C{}}}
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
