// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I<T> where T <: CType {
    func get(): T
}

func makeCString(): CString {
    return unsafe { LibC.mallocCString("override-cstring") }
}

class CStringImpl <: I<CString> {
    public override func get(): CString {
        return makeCString()
    }
}

func useAsIface(): CString {
    let i: I<CString> = CStringImpl()
    return i.get()
}

func forward(i: I<CString>): CString {
    return i.get()
}

main(): Int64 {
    let direct = CStringImpl().get()
    let iface = useAsIface()
    let forwarded = forward(CStringImpl())
    if (direct.isNull() || iface.isNull() || forwarded.isNull()) {
        unsafe {
            LibC.free(direct)
            LibC.free(iface)
            LibC.free(forwarded)
        }
        return 1
    }
    unsafe {
        LibC.free(direct)
        LibC.free(iface)
        LibC.free(forwarded)
    }
    return 0
}
