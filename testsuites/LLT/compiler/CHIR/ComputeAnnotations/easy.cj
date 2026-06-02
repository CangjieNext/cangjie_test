// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

@Annotation
public class CustomAnnotation {
    public const CustomAnnotation(
        let a: String,
        let b: Int,
        let c: UInt8,
        let d: Rune,
        let e: A,
        let f: B,
        let g: (Int,String)
    ) {}
}

public struct A {
    public const init() {}
}
public class B {
    public const init() {}
}
@!CustomAnnotation["Another sample",1,1u8,r'C',A(),B(),(0x89abcdef,"fam")]
func foo(
) {}
main() {}

/* SCAN
_CN7default3fooHv:
    CustomAnnotation{"a": "Another sample","b": 1,"c": 1,"d": 67,"e": A{},"f": B{},"g": (2309737967,"fam")}
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
