// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %enableRedundantAssignRemoval %n.cj
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func f() {
    var x = 0
    func h() {
        func g() {
            x = 1
        }
        g()
    }
    h()
    x
}

main(): Int64 {
    if (f() == 1) {
        return 0
    } else {
        return 1
    }
}
