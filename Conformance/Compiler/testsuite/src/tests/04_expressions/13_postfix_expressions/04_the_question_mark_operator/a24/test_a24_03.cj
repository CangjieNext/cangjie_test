/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a24_03

  @Level:         1

  @Assertion: 4.13.4(24) The following example shows the usage of the operator ?.

              // The usuage of ?.
              class C {
                  var item: Int64 = 100
              }

              let c = C()
              let c1 = Option<C>.Some(c) 
              let c2 = Option<C>.None
              let r1 = c1?.item // r1 = Option<Int64>.Some(100)
              let r2 = c2?.item // r2 = Option<Int64>.None 

              func test1() {
                  c1?.item = 200 // c.item = 200
                  c2?.item = 300 // no effect
              }

              // The usuage of ?()
              let foo = {i: Int64 => i + 1}
              let f1 = Option<(Int64) -> Int64>.Some(foo) 
              let f2 = Option<(Int64) -> Int64>.None
              let r3 = f1?(1) // r3 = Option<Int64>.Some(2)
              let r4 = f2?(1) // r4 = Option<Int64>.None

              // The usuage of ?[] for tuple access
              let tuple = (1, 2, 3)
              let t1 = Option<(Int64, Int64, Int64)>.Some(tuple) 
              let t2 = Option<(Int64, Int64, Int64)>.None
              let r7 = t1?[0] // r7 = Option<Int64>.Some(1)
              let r8 = t2?[0] // r8 = Option<Int64>.None 

              func test3() {
                  t1?[0] = 10 // error: 't1?[0]' is immutable
                  t2?[1] = 20 // error: 't2?[0]' is immutable
              }

  @Description: Check the second negative usage example.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    let tuple = (1, 2, 3)
    let t1 = Option<(Int64, Int64, Int64)>.Some(tuple) 
    let t2 = Option<(Int64, Int64, Int64)>.None

    func test3() {
        t2?[1] = 20 // error: 't2?[0]' is immutable
    }
}

