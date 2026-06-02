/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a25_01

  @Level:         1

  @Assertion:    3.3.1(25)
    let b: Int32                     // Define read-only variable b with type Int32. 
    let c: Int64                     // Define read-only variable c with type Int64. 
    var bb: String                   // Define writeable variable bb with type String. 
    var (x, y): (Int8, Int16)       // Define two writeable variable: x with type Int8, x with type Int16. 
    var `open` = 1                   // Define a variable named `open` with value 1. 
    var `throw` = "throw"            // Define a variable named `throw` with value "throw".

  @Description:  Examples from spec

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

main() {
    let b: Int32                     // Define read-only variable b with type Int32. 
    let c: Int64                     // Define read-only variable c with type Int64. 
    var bb: String                   // Define writeable variable bb with type String. 
    var (x, y): (Int8, Int16)       // Define two writeable variable: x with type Int8, x with type Int16. 
    var `open` = 1                   // Define a variable named `open` with value 1. 
    var `throw` = "throw"            // Define a variable named `throw` with value "throw".
}
