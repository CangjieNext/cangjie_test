// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class C {
    var x: Int64 = 0
    mut prop p: Int64 {
        get() {
            x
        }
        set(v) {
            x = v
        }
    }
}

main() {
    var x = C()
    x.p = 10
    x.p - 10
}
