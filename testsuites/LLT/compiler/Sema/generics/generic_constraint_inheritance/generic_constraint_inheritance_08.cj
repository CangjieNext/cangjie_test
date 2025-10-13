// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

interface Printable {}

interface Runnable {}

interface I {
    // Another constraint than implementation. Must emit compilation error.
    static func id<T>(x: T): T where T <: Printable
}

class Implementation <: I {
    public static func id<T>(x: T): T where T <: Runnable {
        return x
    }
}

main() {}

/* SCAN
error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_constraint_inheritance_08.cj:19:45:
   | 
19 |     public static func id<T>(x: T): T where T <: Runnable {
   |                                             ^^^^^^^^^^^^^ 
   | 
   # note: parent constraint is 'Interface-Printable'

1 error generated, 1 error printed.
*/
