/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Structure:    complex-aux
*/

let x = 2
let y = z          // OK, b.cj does not depend on this file directly or indirectly.
let a = x          // OK.
let c = A()

open class A {
    static var x = A.z         // Error, A.z is used before its initialization.
    static var z = 1
    open public func f(): Int64 {
         return 77
    }
}

class B {
    static var e = A.z       // OK.
    static var f = x         // OK.
}
