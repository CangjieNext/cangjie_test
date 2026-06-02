/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a16_08

  @Level:         1

  @Assertion:    13.1.2.1(16) Only types with CType constraint can be used as
                 parameters type and return type in foreign function. See the
                 following section “type mapping” for the definition of CType
                 constraint.

  @Description:  Tuple type is not allowed as return type in a foreign function.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

foreign func func_01(): (Int32, Int32)

main() {
}
