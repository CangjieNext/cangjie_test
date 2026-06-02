/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_06_a01_01

  @Level:         1

  @Assertion:    13.1.3.6(1)  The function type in Cangjie do not conform to
                 CType constraint, so the CFunc is provided as the mapping of
                 the function type in C.

  @Description:  Check if function type satisfies CType constrains.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

@C func func_01(x: Int32): Int32 { x }

main() {
    let F: (Int32)->Int32 = func_01
    var V: CType = F
}
