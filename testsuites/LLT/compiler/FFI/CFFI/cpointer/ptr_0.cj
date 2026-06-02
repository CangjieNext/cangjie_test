// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-0: %compiler %cmp_opt_chir2hlir %f -o %n.%suffix
// EXEC-0: %run %n.%suffix

main(): Int64 {
    var f: CFunc<() -> CPointer<Unit>> = { => CPointer<Unit>() }
    unsafe { f() }
    return 0
}
