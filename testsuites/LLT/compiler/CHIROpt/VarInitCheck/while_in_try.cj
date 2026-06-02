// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-0:%compiler %disableSemaVic  %cmp_opt -Woff unused %n.cj

class CA {
    var x = 1
}

public func foo1() {
    for (_ in 0..5) {
        try {
            let a: CA
            a = CA()
        } finally {
            0
        }
    }
}

public func foo2() {
    for (_ in 0..5) {
        let a: CA
        a = CA()
    }
}

public func foo3() {
    try {
        for (_ in 0..5) {
            let a: CA
            a = CA()
        }
    } finally {
        0
    }
}

main(): Int32 {
    return 0
}
