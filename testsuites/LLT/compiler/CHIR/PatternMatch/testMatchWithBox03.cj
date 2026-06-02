// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj -o %output
// EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class B {
    func g(): Int64 {
        100
    }
}

interface I {
    func f(): Int64
}

extend B <: I {
    public func f() {
        1
    }
}

main(): Int64 {
    var m: E = C(B())
    let res: Int64 = match (m) {
        case C(x: B) => x.g()
        case _ => 0
    }

    if (res == 100) {
        return 0
    } else {
        return 1
    }
}

enum E {
    C(I)
}
