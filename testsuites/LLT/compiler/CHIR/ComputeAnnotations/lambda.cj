// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

@A[{ =>
    (3,4)[0]
}()]
func foo() {}

@!A[(3,4)[1]]
let a = 3;

@Annotation
public class A {
    public const A(let a: Int) {}
}

main() {}

/* SCAN
_CN7default1aE:
    A{"a": 4}
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
