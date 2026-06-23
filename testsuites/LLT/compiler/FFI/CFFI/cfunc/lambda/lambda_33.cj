// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I1 {
    static func g(): Unit
}

interface I2 <: I1 {
    static func g(): Unit
    func f() {
        let fn: CFunc<()->Unit> = { =>
            g() // equal to I2.g()
        }
        unsafe{fn()}
    }
}

main() {}

/* SCAN
error: static invocation contains unimplemented static function 'g'
  ==> lambda_33.cj:17:13:
   | 
17 |             g() // equal to I2.g()
   |             ^ 
   | 

1 error generated, 1 error printed.
*/
