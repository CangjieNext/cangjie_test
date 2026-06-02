/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_03_a04_01

  @Level:         1

  @Assertion:       5.3.3(4)
                    func f(fn: (Int64)->Int64) { fn(1) }
                    f{ i => i * i }  

  @Description:     Positive example from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

func f(fn: (Int64)->Int64) { fn(1) }

main() {
    Assert.isTrue(f is ((Int64)->Int64) -> Int64)
    var a = f{ i => i * i } 
    Assert.equals(1, a)
}
