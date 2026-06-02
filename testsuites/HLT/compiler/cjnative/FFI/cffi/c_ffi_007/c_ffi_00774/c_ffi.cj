/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum testenum {
    | Var1(Int8)
    | Var2(CPointer<UInt64>)
    | Var3(UInt8)
}

foreign {
    func testfunc(): CPointer<UInt64>

    func free(cp: CPointer<UInt64>): Unit
}

unsafe main(): Int64 {
    var count = 0

    var pui64 = testfunc()
    if (pui64.isNull()) {
        return 2
    }
    if ((pui64.read(0) == 3) && (pui64.read(1) == 6) && (pui64.read(2) == 9)) {
        count += 1
    }

    var ts = testenum.Var2(pui64)

    var res = match (ts) {
        case Var2(x) => 0
        case _ => 1
    }

    free(pui64)
    if (count == 1) {
        return res
    } else {
        return 2
    }
}
