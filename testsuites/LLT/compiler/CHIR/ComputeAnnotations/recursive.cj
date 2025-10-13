// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

@Annotation
public class CustomAnnotation {
    public const CustomAnnotation(
        let b: B
    ) {}
}

public struct A {
    public const A(let b: B) {}
}
public enum B {
    B1(A) | B2(C) | B3
}
public enum C {
    C1(B) | C2
}

@!CustomAnnotation[B1(A(B1(A(B3))))]
@!CustomAnnotation[B2(C1(B3))]
func foo(
) {}
main() {}

/* SCAN
_CN7default3fooHv:
    CustomAnnotation{"b": B{0,A{"b": B{0,A{"b": B{2}}}}}}
    CustomAnnotation{"b": B{1,C{0,B{2}}}}
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
