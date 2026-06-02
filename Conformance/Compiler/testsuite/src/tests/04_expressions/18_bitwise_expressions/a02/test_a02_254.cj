
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a02_254

  @Level:         1

  @Assertion:   4.18(2) Bitwise operators can only be applied to operands of integer types.
  @Description: Checks that using bitwise operator << with types Float32 and C is not permitted.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

class C {}

main() {
    var v1 : Float32 = 1.0
    var v2 : C = C()
    let v3 = v1 << v2
}
