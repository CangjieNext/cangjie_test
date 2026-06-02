// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

main() {
    /* Sub-Case B-2: future obj get result call */
    var f = spawn {
        var x: Int8 = 100
        var y: Int8 = 27
        return x + y
    }
    var res = f.get()

    return 0
}
