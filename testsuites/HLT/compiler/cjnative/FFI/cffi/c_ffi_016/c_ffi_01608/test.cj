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

foreign func test(ptr: CPointer<Int64>): CPointer<Int64>

main() {
    var ptr = unsafe { LibC.malloc<Int64>(count: 10) }
    try (r = ptr.asResource()) {
        var pt = unsafe { test(r.value) }
        if (unsafe { pt.read() } == 5) {
            return 0
        }
    }
    return 1
}
