// EXEC-PIPE: %compiler %f --debug-annotations | compare %f
main() {}

public open class A {
    public const A(let a: Int) {}
}
public open class B <: A {
    public const B(a: Int, let b: Int) {
        super(a)
    }
}

@Annotation
public class Am {
    public const Am(let a: A) {}
}

@!Am[B(3,4)]
class MF {
}

/* SCAN
_CN7default2MFE:
    Am{"a": B{"a": 3,"b": 4}}
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
