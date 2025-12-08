/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output %boundscheck
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

let AI_PASSIVE: Int32 = 0x0001
let AI_ALL: Int32 = 0x0010
let NULL_CSTRING = CString(CPointer<UInt8>())
let BYTES_ADDR_INFO: UIntNative = 48
let AI_IPPROTO_TCP: IntNative = 6

@C
struct teststruct {
    public var a: Int32
    public var b: Int32
    public var c: Int32
    public var d: Int32
    public var e: Int32
    public var flags: Int32 = AI_PASSIVE | AI_ALL
    public var family: Int32 = 1
    public var socktype: Int32 = 0
    public var protocol: Int32 = 0
    public var addrlen: Int32 = 0
    public var addr: CPointer<Unit> = CPointer<Unit>()
    public var canonname: CString = NULL_CSTRING
    public var next: CPointer<teststruct> = CPointer<teststruct>()

    public func toString(): String {
        "flags=${flags}, family=${family}, socktype=${socktype}, protocol=${protocol}, addrlen=${addrlen}"
    }
    public init(a!: Int32, b!: Int32, c!: Int32, d!: Int32, e!: Int32, flags!: Int32 = AI_PASSIVE | AI_ALL,
        family!: Int32 = 1, socktype!: Int32 = 0, protocol!: Int32 = 0, addrlen!: Int32 = 0,
        addr!: CPointer<Unit> = CPointer<Unit>(), canonname!: CString = NULL_CSTRING,
        next!: CPointer<teststruct> = CPointer<teststruct>()) {
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
    func testfunc(n: Int64, ppst: CPointer<CPointer<teststruct>>): CPointer<CPointer<teststruct>>

    func GetDoublePtr(): CPointer<CPointer<teststruct>>

    func MallocWithZero(size: UIntNative): CPointer<Unit>

    func free(cp: CPointer<Unit>): Unit
}

var count = 0

unsafe main(): Int64 {
    var pa = MallocWithZero(10)
    var pb = CPointer<Unit>(pa)

    var struct1 = teststruct(a: -111, b: 111, c: -111, d: 111, e: -111, flags: AI_ALL, family: 1, socktype: 0,
        protocol: 0, addrlen: 0, addr: pb, canonname: NULL_CSTRING)

    var p1 = MallocWithZero(64)
    var pst1 = CPointer<teststruct>(p1)
    pst1.write(struct1)

    var ppst1 = GetDoublePtr()
    ppst1.write(pst1)

    var ppst2 = testfunc(11, ppst1)

    if ((ppst2.read().read().a == -122) && (ppst2.read().read().b == 122) && (ppst2.read().read().c == -122) && (ppst2
        .read()
        .read()
        .d == 122) && (ppst2.read().read().e == -122)) {
        count += 1
    }

    free(CPointer<Unit>(pb))
    free(CPointer<Unit>(pst1))
    free(CPointer<Unit>(ppst1))

    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
