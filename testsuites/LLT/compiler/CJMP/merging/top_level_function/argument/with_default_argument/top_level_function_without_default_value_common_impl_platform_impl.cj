// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common  func foo(input!:String): Unit{
    println("From common member foo func")
    println(input)
}
    

// SEPARATE-FILE: p.cj
// EXEC-0: %compiler %noColor --experimental p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// RUN-EXEC-PIPE-0: %run %output 2>&1 | compare %f
package cmp

platform  func foo(input!:String  = "platform" ): Unit {
    println("From platform member foo func")
    println(input)
}
main() {
    foo(input:"platform1")
    foo()
    
}

/* SCAN
From platform member foo func
platform1
From platform member foo func
platform
*/
