// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output

class A {
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
    return 0
}
