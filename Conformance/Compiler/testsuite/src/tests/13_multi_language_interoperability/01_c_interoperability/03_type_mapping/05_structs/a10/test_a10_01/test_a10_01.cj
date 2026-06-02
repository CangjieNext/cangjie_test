/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:     13_01_03_05_a10_01

  @Level:         1

  @Assertion:    13.1.3.5(10) The member variables of the VArray type in @C struct must be 
  consistent with the memory layout of the array in C.
  For example, for the following C structure type:
  struct S{
  int a[2];
  int b[0];
  int c[];
  }
  In Cangjie, you can declare the following structure in correspondence with the C code:
  @C struct S{
  var a:VArray <Int32 ,$2>=VArray <Int32 ,$2>(repeat:0)
  var b:VArray <Int32 ,$0>=VArray <Int32 ,$0>(repeat:0)
  var c:VArray <Int32 ,$0>=VArray <Int32 ,$0>(repeat:0)
  }

  @Description:  Checks memory layout matching for the specification example.

  @Mode:         run

  @Negative:     no

  @Structure:    single
  @Issue:        0006077


*/

import utils.assert.Assert

@C struct S{
    var a:VArray<Int32, $2> = VArray<Int32, $2>(repeat:0)
    var b:VArray<Int32, $0> = VArray<Int32, $0>(repeat:0)
    var c:VArray<Int32, $0> = VArray<Int32, $0>(repeat:0)
}

foreign func dup(x: S): S
foreign func sum(x: CPointer<S>, n: IntNative): S

main() {
    var s = S()
    s.a = [2, 3]
    let copy = unsafe { dup(s) }
    Assert.equals(s.a[0], copy.a[0])
    Assert.equals(s.a[1], copy.a[1])
    Assert.equals(0, copy.b.size)
    Assert.equals(0, copy.c.size)

    var a: VArray<S, $2> = [s, copy]
    let sum = unsafe{ sum(inout a, 2) }
    Assert.equals(4, sum.a[0])
    Assert.equals(6, sum.a[1])
}
