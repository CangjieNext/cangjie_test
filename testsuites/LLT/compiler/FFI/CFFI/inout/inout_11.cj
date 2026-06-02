// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c

// EXEC: %clang %clang_shared_opt foo.c -o libfoo.%dylib_suffix
// EXEC: %compiler %cmp_opt_chir2hlir %noColor %f -L . -l foo -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan 0, 1, {2, 3, 4, 5}
// ASSERT: scan 10, 11, {12, 13, 14, 15}

foreign func ReplaceCallback(ptr: CPointer<CFunc<(CPointer<Int64>, CPointer<Int32>, CPointer<Data>) -> Unit>>): Unit

@C
struct Data {
    var a: Int8 = 2
    var b: Int16 = 3
    var c: Int32 = 4
    var d: Int64 = 5
}

main() {
    var a = 0
    var b: Int32 = 1
    var d = Data()
    var f: CFunc<(CPointer<Int64>, CPointer<Int32>, CPointer<Data>) -> Unit> = { ptr1, ptr2, ptr3 =>
        let v1 = unsafe { ptr1.read() }
        let v2 = unsafe { ptr2.read() }
        let v3 = unsafe { ptr3.read() }
        println("${v1}, ${v2}, {${v3.a}, ${v3.b}, ${v3.c}, ${v3.d}}")
    }
    unsafe {
        f(inout a, inout b, inout d)
        ReplaceCallback(inout f)
        f(inout a, inout b, inout d)
    }
    println("${a}, ${b}, {${d.a}, ${d.b}, ${d.c}, ${d.d}}")
}
