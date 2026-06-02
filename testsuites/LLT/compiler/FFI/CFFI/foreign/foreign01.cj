// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c

// (CJNATIVE) EXEC: %clang %clang_opt %n.c -o %n.%middle
// (CJNATIVE) EXEC: %compiler --verbose %f %n.%middle -o %n.%suffix
// (not CJNATIVE) EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// (not CJNATIVE) EXEC: %compiler --verbose %f %cffi-link -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

foreign func testfunc(): CPointer<Int16>
foreign func free(cp: CPointer<Int16>): UInt

unsafe main() {
    var ptr: CPointer<Int16> = testfunc()
    if (!ptr.isNotNull()) {
        return 1
    }

    free(ptr)
    return 0
}
