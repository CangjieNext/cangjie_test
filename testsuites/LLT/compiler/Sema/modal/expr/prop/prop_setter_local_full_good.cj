// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output -Woff all
// RUN-EXEC: %run %run_opt %output %run_args

class C {
    init() {}
    init(this @local!) {
        exclave {}
    }
    mut prop x: Int64 {
        get(this @local!) { exclave { return 42 } }
        set(this @local!, v) { exclave {} }
    }
}
main() {
    let c: C @local! = C()
    c.x = 10
    println(c.x)
}
