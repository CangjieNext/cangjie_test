// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c

// EXEC: %clang %clang_shared_opt foo.c -o libfoo.%dylib_suffix
// EXEC: %compiler %cmp_opt_chir2hlir %noColor %f -L . -l foo -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan 2
// ASSERT: scan 4
// ASSERT: scan 6

foreign func PlusTwo(ptr: CPointer<Int64>): Unit

class Data {
    public static var a: Int64 = 0

    public func foo() {
        unsafe {
            PlusTwo(inout a)
        }
    }
}

main() {
    unsafe { PlusTwo(inout Data.a) }
    println(Data.a)
    unsafe { PlusTwo(inout Data.a) }
    println(Data.a)
    var data = Data()
    data.foo()
    println(Data.a)
}
