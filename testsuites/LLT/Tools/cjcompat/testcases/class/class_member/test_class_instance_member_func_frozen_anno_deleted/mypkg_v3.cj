// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
const public func fff() {
    M().mmm(42)
}

public class M {
    const init() {
    }

    const func mmm() {
    }
    
    const func mmm(x: Int64) {
        x
    }

    const public func ggg() {
        mmm()
    }
}

main() {}