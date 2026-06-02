// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f

interface I {
    func foo(x: Int64): Int64
}

interface I2 <: I {}

class B <: I2 {
    public let a: (Int64) -> Int64
    public func foo(x: Int64): Int64 {
        return 199
    }
    public init() {
        a = foo
    }
}

main() {
    var b = B().a(1000)

    if (b == 199) {
        return 0
    }
    return 1
}

/* SCAN
error: 'foo' is not allowed to be accessed before all member variables are initialized
  ==> class_interface_member.cj:21:13:
   | 
21 |         a = foo
   |             ^ 
   | 

1 error generated, 1 error printed.
*/
