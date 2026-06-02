// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o lib%n.%dylib_suffix
// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %f -L . -l %n -o %output 2>&1 | compare %f
// ASSERT: regex invalid binary operator '==' on type 'CPointer<.*CString>' and '.*CString'

foreign {
    func testfunc(): CPointer<CString>
}

unsafe func foo<T>(pstr: CPointer<CString>): CPointer<CString>{
    pstr.write(0, LibC.mallocCString("abc"))
    return pstr
}

unsafe main(): Int64 {
    var p1 = testfunc()
    var res = foo<CPointer<CString>>(p1)

    if (res == LibC.mallocCString("cang")) {
        return 0
    } else {
        return 1
    }
}
