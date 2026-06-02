/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a07_01

  @Level:         1

  @Assertion:    13.1.3.2(7) In Cangjie, a variable of type CFunc can be
                 converted to a specific CPointer.
 
  @Description:  Convert CFunc to CPointer.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

@C
func func_01(x: Int32): Int32 {
    return x + 100
}

main() {
    var F: CFunc<(Int32)->Int32> = func_01
    var P: CPointer<Unit> = CPointer<Unit>(F)
}
