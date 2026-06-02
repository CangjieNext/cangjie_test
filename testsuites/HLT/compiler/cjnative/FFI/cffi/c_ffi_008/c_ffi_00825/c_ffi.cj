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

foreign func testfunc(): CPointer<Bool>

var top_a: Bool = true

func test() {
    var ptr: CPointer<Bool> = unsafe { testfunc() }
    var res1 = true && unsafe { ptr.read(0) };;
    true
    var res2 = unsafe { top_a && res1 }
    unsafe { LibC.free(ptr) }
}

main(): Int64 {
    test()
    return 0
}
