// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

@Annotation
public class CustomAnnotation {
    public const CustomAnnotation(
        let a: String
    ) {}
}

public struct A {
    public const init() {}

    const func foo() { 3 }
}
public class B {
    public const init() {}
}
public interface C {
    const func bar() {-1}
}
public enum D <: C {
    D1 | D2(C)
    public const func jar() { "haha" }
}

@!CustomAnnotation["Another sample"]
func foo(
) {}
main() {}

/* SCAN
_CN7default3fooHv:
    CustomAnnotation{"a": "Another sample"}
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
