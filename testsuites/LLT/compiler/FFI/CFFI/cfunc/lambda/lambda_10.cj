// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f 2>&1

main() {
    let f1: CFunc<() -> Int64> = { => 
        var a = 0
        unsafe {
            a
        }
    }

    unsafe { f1() }
}
