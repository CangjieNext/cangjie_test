// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c

// EXEC: %clang %clang_shared_opt foo.c -o libfoo.%dylib_suffix
// EXEC: %compiler %cmp_opt_chir2hlir %noColor %f -L . -l foo -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan 22

foreign func PlusTwo(ptr: CPointer<Int64>): Unit

@C
func PlusThree(ptr: CPointer<Int64>) {
    unsafe {
        let old = ptr.read()
        ptr.write(old + 3)
    }
}

let PlusFour: CFunc<(CPointer<Int64>) -> Unit> = { ptr =>
    unsafe {
        let old = ptr.read()
        ptr.write(old + 4)
    }
}

struct Data {
    var a: Int64 = 0

    mut func set1() {
        a = 0
        unsafe { PlusTwo(inout a) }
        unsafe { PlusTwo(inout this.a) }
        unsafe { PlusThree(inout a) }
        unsafe { PlusThree(inout this.a) }
    }
}

extend Data {
    mut func set2() {
        unsafe { PlusTwo(inout a) }
        unsafe { PlusTwo(inout this.a) }
        unsafe { PlusFour(inout a) }
        unsafe { PlusFour(inout this.a) }
    }
}

main() {
    var d = Data()
    d.set1()
    d.set2()
    println(d.a)
}
