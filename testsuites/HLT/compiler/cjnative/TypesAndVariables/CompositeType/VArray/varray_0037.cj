/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args


class A {
    var a: VArray<Int64, $3> = [1, 2, 3]
    mut prop varr: VArray<Int64, $3> {
        get() {
            a
        }
        set(v) {
            a = v
        }
    }
}

main(): Int64 {
    var a = A()
    a.varr = [0, 0, 0]
    return a.varr[0]
}
// ASSERT: scan-1 sema_varray_cjvm_in_ref_type
