/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a07_01

  @Level:         1

  @Assertion:     5.1.4(7) Examples are as follows. 
                  func Column(c: (Data) -> Unit): Unit { 2 } // return () is automatically inserted 
                  func Column(c: (Data) -> Unit) { 2 }          // return type is Int64 

  @Description:   Positive example from the spec part 1.

  @Mode:          run

  @Negative:      no

  @Structure:     single

  @CompileWarning: ignore

*/
import utils.assert.Assert

type Data = Int32

func myFunc(a: Data): Unit { "${a}" } 

func Column(c: (Data) -> Unit): Unit { 2 } // return () is automatically inserted 

main() {
  var myVar = myFunc
  Assert.isTrue(Column(myVar) is Unit)
}
