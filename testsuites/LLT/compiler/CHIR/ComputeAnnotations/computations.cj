// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

@Annotation
public class CustomAnnotation {
    public const CustomAnnotation(
        let a: A
    ) {}
}

public struct A {
    let v: Int
    public const A(v: Int, let p: String) {
        this.v = v+1
    }
}

const c = A(3, "immer")
const d = "18"

@!CustomAnnotation[(c,d)[0]]
public class C {

    @!CustomAnnotation[(d,c)[1]]
    public func foo() {}
}

main() {}

/* SCAN
_CN7default1CE:
    CustomAnnotation{"a": A{"v": 4,"p": "immer"}}
_CN7default1C3fooHv:
    CustomAnnotation{"a": A{"v": 4,"p": "immer"}}
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
