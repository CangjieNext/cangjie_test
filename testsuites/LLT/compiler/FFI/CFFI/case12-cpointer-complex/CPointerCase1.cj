// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: c1.c
// (Linux or Darwin) EXEC: %clang %clang_shared_opt c1.c -o %cffi_output
// (Windows) EXEC: %clang %clang_shared_opt c1.c -lsecurec -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC:  %pwd_to_ld_path %run %run_opt %output %run_args | compare %f

// ASSERT: scan pass1\n
// ASSERT: scan pass2\n
// ASSERT: scan-not Exception


let AI_PASSIVE: IntNative = 0x0001
let AI_ALL: IntNative = 0x0010
let NULL_CSTRING = CString(CPointer<UInt8>())
let BYTES_ADDR_INFO: UIntNative = 48
let AI_IPPROTO_TCP: IntNative = 6

@C
struct teststruct {
    public var a: Int32 = -111
    public var b: Int32 = 111
    public var c: Int32 = -111
    public var d: Int32 = 111
    public var e: Int32 = -111


    public init(a!: Int32, b!: Int32, c!: Int32, d!: Int32, e!: Int32) {
        this.a = a
        this.b = b
        this.c = c
        this.d = d
        this.e = e
    }
}

foreign {
    func testfunc(a: Int8, pst: CPointer<teststruct>): CPointer<teststruct>
    func MallocWithZero(size: UIntNative): CPointer<Int8>
}

unsafe main():Int64 {
    println("size of teststruct in Cangjie is : ${sizeOf<teststruct>()}\n")
    var struct1 = teststruct(a: -111, b: 111, c: -111, d: 111, e: -111)
    var p1 = LibC.malloc<teststruct>(count:1)
    var pst1 = CPointer<teststruct>(p1)
    pst1.write(struct1)

    var pst2 = testfunc(11, pst1)

    if ( (pst2.read().a == -122) && (pst2.read().b == 122) && (pst2.read().c == -122) && (pst2.read().d == 122) && (pst2.read().e == -122)) {
        print("pass2\n")
    }
    unsafe {
        LibC.free(p1)
    }
    return 0
}


// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
