// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

@Annotation
public class CustomAnnotation {
    public const CustomAnnotation(let a: Int) {}
}

@!CustomAnnotation[{ a:Int,b:Int => try {
    let c=a+b 
    c
} catch (_:OverflowException) {
    a 
}}(1,2)]
func foo(
) {}
main() {}

// core dumped at CHIR, foo.AnnotationArray is empty

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
