// EXEC-PIPE: %compiler %f --debug-annotations | compare %f

class F {
    @!J[G.bat()] static func foo() { 3 }
}

class G {
    public const static func bat() {
        1
    }
}

@!J[G.bat()]
@Annotation
public class J {
    public const J(let a: Int) {}
}

main() {
}

/* SCAN
_CN7default1F3fooHv:
    J{"a": 1}
_CN7default1JE:
    J{"a": 1}
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
