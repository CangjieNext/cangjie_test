// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

 common struct A{
    common public init(){}       
    common  func foo(a:Int64,b!:Int64 =2,c!:Int64 = 3): Unit{
        println("From common member foo func")
        println(a)    
        println(b)
        println(c)
    }
 }

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
platform struct A{
  
    platform  func foo(a:Int64,b!:Int64 ,c!:Int64 ): Unit{
        println("From platform member foo func")
        println(a)    
        println(b)
        println(c)
    }
}
main() {
    let a = A()
    a.foo(1)
}

/* SCAN
From platform member foo func
1
2
3
*/