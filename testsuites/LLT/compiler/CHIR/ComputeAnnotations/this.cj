// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

@Annotation
public class CustomAnnotation {
    public const CustomAnnotation(
        let a: A
    ) {}
}

public struct A {
    let v: Int
    public const A(let a: Int) {
        v = this.a
    }
}

@!CustomAnnotation[A(3)]
public class C {
}

main() {}

/* SCAN
_CN7default1CE:
    CustomAnnotation{"a": A{"v": 3,"a": 3}}
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
