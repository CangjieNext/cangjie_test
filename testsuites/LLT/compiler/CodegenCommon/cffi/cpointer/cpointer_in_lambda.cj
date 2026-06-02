// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %f %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan 20\n

foreign func testA(): CPointer<Int64>

foreign func testB(): CPointer<Int64>

unsafe main(): Int64 {
    var cp: CPointer<Int64> = unsafe { testA() }
    func test() {
        unsafe {
            cp = testB()
            println(cp.read())
        }
        ()
    }
    test()
    return 0
}
