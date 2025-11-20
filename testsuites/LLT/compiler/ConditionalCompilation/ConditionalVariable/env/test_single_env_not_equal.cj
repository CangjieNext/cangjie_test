// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %cmp_opt %n.cj -o %output
// EXEC:%run %run_opt %output %run_args
// (Windows) scan target env is gnu
// (MAC) scan target env is not gnu

package b

// macOS device target is not gnu
@When[env != "gnu"]
class mc {
    func p() {
        println("target env is not gnu")
    }
}

// windows device target is gnu
@When[env == "gnu"]
class mc {
    func p() {
        println("target env is gnu")
    }
}

main(): Int64 {
    var a = mc()
    a.p()
    return 0
}
