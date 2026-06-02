/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a08_01

  @Level:         1

  @Assertion:    13.1.3.2(8) The generic parameter CPointer can be any type
                 that meets the CType constraint.
 
  @Description:  Convert CFunc to CPointer<Int8>.

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
    var P: CPointer<Int8> = CPointer<Int8>(F)
}
