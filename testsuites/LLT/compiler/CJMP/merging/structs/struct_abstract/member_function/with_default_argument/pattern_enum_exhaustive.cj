// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
enum TimeUnit { 
    | Year(Float32)
    | Month(Float32, Float32)
}
common struct A{
    common public init(){}   
    common func foo():Unit {
        let oneYear = TimeUnit.Year(1.0)
        var howManyHours: Float32 = match (oneYear) { // error: match must be exhaustive
            case Year(y) => y * Float32(365 * 24)
            case Month(y, m) => y * Float32(365 * 24) + m * Float32(30 * 24)
        }
        println(howManyHours)
    }
}   

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (LLVM and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (LLVM and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (LLVM and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
platform struct A{} 

main() {
    let a = A()
    a.foo()
}

/* SCAN
8760.000000
*/