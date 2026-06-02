// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %n.%suffix
// EXEC: %run %n.%suffix 2>&1 | compare %f
// ASSERT: scan Emmm...

struct Emmm {
    var f1: CFunc<() -> Unit> = {
        => println("Emmm...")
    }
}

main(): Int64 {
    let emm = Emmm()
    unsafe { emm.f1() }
    0
}
