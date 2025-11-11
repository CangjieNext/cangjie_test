// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
 
interface I {}

common enum EnA<T> { A } 
common enum EnB<T> { A | B(T) | C }
common enum EnC<T> where T <: I { A | B | C(T) }
 
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

platform enum EnA<T> { A }
platform enum EnB<T> { A | B(T) | C }
platform enum EnC<T> { A | B | C(T) }
 
main(){
    let _ = EnA<String>.A
    match (EnB<Int>.B(123)) {
      case A | C => println("EnB fail")
      case B(value) => println(value)
    }
    match (EnC<String>.C("ok")) {
        case A | B => println("EnC fail")
        case C(value) => println(value)
    }
}
 
/* SCAN
123
ok
*/
