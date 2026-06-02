// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c

// (CJNATIVE) EXEC: %clang %clang_opt %n.c -o %n.%middle
// (CJNATIVE) EXEC: %compiler --verbose %f %n.%middle -o %n.%suffix
// (not CJNATIVE) EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// (not CJNATIVE) EXEC: %compiler --verbose %f %cffi-link -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

package test
 

@C
public struct R {
    public var x: Int64
    public var y: Int64
    public var z: Int64

    public init(a: Int64) {
        x = a
        y = a
        z = a
    }
}

foreign func a2(arg0: R, arg1: R): R

main(): Int64 {
    unsafe {
        a2(R(1), R(2))
    }
    return 0
}
