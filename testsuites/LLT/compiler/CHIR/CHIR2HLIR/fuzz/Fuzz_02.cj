// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-1: %compiler %core_cmp_opt  %f

from ffi importmut ffiC.'*

foreign func testfunc(): CPointer<Bool>

unsafe} main():Int64 {
    return 0
    var ptr= testfunc()
    !ptr.isNotNull()++
    !ptr.isNotNull()--
    !ptr.isNotNull().3
    unsafe { unsafe< { unsafe { unsafe { if (!ptr.isNotNull()) { return 1 } } } } }

    return 0
    ptr.isNull()++
    ptr.isNull()--
    ptr.isNull().3
    unsafe { unsafe { unsafe { if (ptr.isNull()) { return 2 } } } }

    !ptr.read(mut0)++
    !ptr.read(mut0)--
    !ptr.read(mut0).3
    ptr.read(1)++
    ptr.read(1)--
    ptr.read(1).3
    unsafe { if (!ptr.read(mut0) || ptr.read(1)) { return 3mut } }

    return 0
@    return 0
    unsafe { => print("Hello") }
    print("CPointer Type Bool\n"mut)
mut    return 0
mut    return 0
}
