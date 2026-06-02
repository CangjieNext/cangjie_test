
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a15_001

  @Level:         1

  @Assertion:   4.23(15) A left value expression is legal only if it is mutable. For the mutability of the above
                expressions, see the corresponding sections.
  @Description: Checks that enum values cannot be assigned.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore

*/
enum E { 
    | E1
}

main() {
    E1 = E1
    return 0
}
