// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: c2.c
// (Darwin) EXEC: %clang %clang_shared_opt -Wl,-undefined,suppress,-flat_namespace c2.c -o %cffi_output
// (Linux) EXEC: %clang %clang_shared_opt c2.c -o %cffi_output
// (Windows) EXEC: %clang %clang_shared_opt c2.c -lsecurec -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC:  %pwd_to_ld_path %run %run_opt %output %run_args | compare %f

// ASSERT: scan pass1\n
// ASSERT: scan pass2\n
// ASSERT: scan-not Exception


let AI_PASSIVE: IntNative =	0x0001
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
    public var flags: IntNative = AI_PASSIVE | AI_ALL
    public var family: IntNative = 1
    public var socktype: IntNative = 0
    public var protocol: IntNative = 0
    public var addrlen: UIntNative = 0
    public var addr: CPointer<Unit> = CPointer<Unit>()
    public var canonname: CString = NULL_CSTRING
    public var next: CPointer<teststruct> = CPointer<teststruct>()

    public func toString(): String {
        "flags=${flags}, family=${family}, socktype=${socktype}, protocol=${protocol}, addrlen=${addrlen}"
    }
    public init(a!: Int32, b!: Int32, c!: Int32, d!: Int32, e!: Int32, flags!: IntNative = AI_PASSIVE | AI_ALL, family!: IntNative = 1, socktype!: IntNative = 0, protocol!: IntNative = 0, addrlen!: UIntNative = 0, addr!: CPointer<Unit> = CPointer<Unit>(), canonname!: CString = NULL_CSTRING, next!: CPointer<teststruct> = CPointer<teststruct>()) {
        this.a = a
        this.b = b
        this.c = c
        this.d = d
        this.e = e
        this.flags = flags
        this.family = family
        this.socktype = socktype
        this.protocol = protocol
        this.addrlen = addrlen
        this.addr = addr
        this.canonname = canonname
        this.next = next
    }
}

foreign {
    func testfunc(n: Int8, ppst: CPointer<CPointer<teststruct>>): CPointer<CPointer<teststruct>>
    func GetDoublePtr(): CPointer<CPointer<teststruct>>
    func MallocWithZero(size: UIntNative): CPointer<Unit>
}

unsafe main():Int64 {
    println("size of teststruct in Cangjie is : ${sizeOf<teststruct>()}\n")
    var pa = MallocWithZero(10) // Need free.
    var pb = CPointer<Unit>(pa)

    var struct1 = teststruct(a: -111, b: 111, c: -111, d: 111, e: -111, flags: AI_ALL, family: 1, socktype: 0, protocol: 0, addrlen: 0, addr: pb, canonname: NULL_CSTRING)

    var p1 = LibC.malloc<teststruct>(count:1) // Need free.
    var pst1 = CPointer<teststruct>(p1)
    pst1.write(struct1)

    var ppst1 = GetDoublePtr() // Need free.
    ppst1.write(pst1)

    var ppst2 = testfunc(11, ppst1)

    if ( (ppst2.read().read().a == -122) && (ppst2.read().read().b == 122) && (ppst2.read().read().c == -122) && (ppst2.read().read().d == 122) && (ppst2.read().read().e == -122)) {
        print("pass2\n")
    }
    unsafe {
        LibC.free(pa)
        LibC.free(p1)
        LibC.free(CPointer<Unit>(ppst1))
    }
    return 0
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
