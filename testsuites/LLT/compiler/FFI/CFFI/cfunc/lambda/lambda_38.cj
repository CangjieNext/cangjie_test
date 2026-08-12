// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I1<T1> {
    static func g(): Unit
}

interface I2 <: I1<Int64> & I1<String> {
    static func f() {
        let fn: CFunc<()->Unit> = { =>
            g() // equal to I1<Int64>.g()
        }
        unsafe{fn()}
    }
}

main() {
    I2.f()
}

/* SCAN
error: static invocation contains unimplemented static function 'g'
  ==> lambda_38.cj:16:13:
   | 
16 |             g() // equal to I1<Int64>.g()
   |             ^ 
   | 

error: static invocation contains unimplemented static function 'g'
  ==> lambda_38.cj:23:5:
   | 
23 |     I2.f()
   |     ^^^^ 
   | 
note: indirect use of unimplemented function reference here
  ==> lambda_38.cj:16:13:
   | 
16 |             g() // equal to I1<Int64>.g()
   |             ^ 
   | 

2 errors generated, 2 errors printed.
*/
