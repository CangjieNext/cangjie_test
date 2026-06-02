/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// (target_ios | target_ios_simulator) EXEC: %clang %clang_opt p1/native.c -o native.o
// (!(target_ios | target_ios_simulator)) EXEC: %clang %clang_opt p1/native.c -o libnative.%test_suffix
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt  -L./ -lnative p1.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.*

main() {
    let a = A<Int32>()
    let b = a.goo()
    let c = a.noo()
    let d = C<Bool>()
    let e = d.a.bar()
    if (b != 1800) {
        return 1
    }
    if (c != 4200) {
        return 2
    }
    if (e != 200) {
        return 3
    }
    return 0
}
