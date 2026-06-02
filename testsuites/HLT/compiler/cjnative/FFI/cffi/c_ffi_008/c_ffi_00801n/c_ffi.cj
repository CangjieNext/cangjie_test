/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: pkg cfg.json cfg-main.json c_ffi.c
// (not Windows) EXEC: %clang %clang_opt %n.c -o lib%n.%test_suffix
// (not Windows) EXEC: %sed %sed_opt "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// (not Windows) EXEC: %sed %sed_opt "s!cangjieCFFI_path!%cstring_cjo!g" cfg-main.json
// (not Windows) EXEC: %compiler %cmp_opt %pkg_compile pkg/pkg.cj -o pkg/
// (not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f %pkg_link -o %output 2>&1 | compare %f

import pkg.*

unsafe main(): Int64 {
    var ptr: CPointer<Bool> = testfunc()

    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    if (!ptr.read(0) || ptr.read(1)) {
        return 3
    }

    print("CPointer Type Bool\n")
    return 0
}
// (not Windows) ASSERT: scan sema_undeclared_identifier
