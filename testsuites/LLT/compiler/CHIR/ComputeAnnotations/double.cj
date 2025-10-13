// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

const c = C()
@!A[a:c, b:c]
func foo() {}

@Annotation
public class A {
    public const A(let a!: C, let b!: C = a) {}
}

public class C {
    public const C() {
        
    }
}

const m = "haha"
@!A2[m, m]
var get = 3

@Annotation
public class A2 {
    public const A2(let a:String, let b:String) {}
}

main() {}

/* SCAN
_CN7default3fooHv:
    A{"a": C{},"b": C{}}
_CN7default3getE:
    A2{"a": "haha","b": "haha"}
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
