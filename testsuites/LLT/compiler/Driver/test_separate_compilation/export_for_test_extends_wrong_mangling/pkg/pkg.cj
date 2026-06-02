// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

struct Code {
    Code(let code: Int) {}
}

extend Code <: Equatable<Code> {
    public operator func ==(other: Code): Bool {
        code == other.code
    }
}

extend Code {
    func derivingChecks_(): Unit {
        let _: Equatable<Int> = code
    }
}
