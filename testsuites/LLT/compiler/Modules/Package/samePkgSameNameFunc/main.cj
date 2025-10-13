// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkga
// EXEC: %compiler -p %compile_lib_opt pkga -o pkga.%middle
// EXEC: %compiler pkga.%middle %n.cj -o %n.%suffix
// EXEC: %run %n.%suffix

internal import pkga.*
import pkga

func run(): Int64 {
    let v0: Int64 = 1
    let v1: String = "a"
    let x: Int64 = pkga.Data<Int64>(v0)
    let y: Int64 = pkga.Data<Int64, String>(v0, v1)
    let x2: Int64 = pkga.Data(v0)
    let y2: Int64 = pkga.Data(v0, v1)
    if (x != 1) {
        return 1
    }
    if (y != 1) {
        return 1
    }
    if (x2 != 2) {
        return 1
    }
    if (y2 != 2) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
