/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_04_a04_02

  @Level:         1

  @Assertion:    13.1.4(4) The CType interface is an interface type in Cangjie
                 and does not meet the CType constraint. 

  @Description:  CType cannot be used as @C function return value type.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

@C
func func_01(x: Int32): CType { x }

main() {
}
