// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c

// EXEC: %clang %clang_shared_opt foo.c -o libfoo.%dylib_suffix
// EXEC: %compiler %cmp_opt_chir2hlir %noColor %f -L . -l foo -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan 2, 3, 4, 5
// ASSERT: scan 6, 7, 8, 9

foreign func PlusTwo(ptr: CPointer<Int64>): Unit

struct Data {
    var a: Int64 = 0
    var b: Int64 = 1
    var c: Int64 = 2
    var d: Int64 = 3
}

@C
struct CData {
    var a: Int64 = 4
    var b: Int64 = 5
    var c: Int64 = 6
    var d: Int64 = 7
}

main() {
    var d = Data()
    unsafe {
        PlusTwo(inout d.a)
        PlusTwo(inout d.b)
        PlusTwo(inout d.c)
        PlusTwo(inout d.d)
    }
    println("${d.a}, ${d.b}, ${d.c}, ${d.d}")

    var cd = CData()
    unsafe {
        PlusTwo(inout cd.a)
        PlusTwo(inout cd.b)
        PlusTwo(inout cd.c)
        PlusTwo(inout cd.d)
    }
    println("${cd.a}, ${cd.b}, ${cd.c}, ${cd.d}")
}
