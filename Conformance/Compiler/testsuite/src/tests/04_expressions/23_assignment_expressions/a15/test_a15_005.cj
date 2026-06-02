
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a15_005

  @Level:         1

  @Assertion:   4.23(15) A left value expression is legal only if it is mutable. For the mutability of the above
                expressions, see the corresponding sections.
  @Description: Check that attempt to assign to optional chaining expression which is a function causes a compilation
                error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore

*/

main() {
    var f: ?((Int64) -> Int64) = { x => x }
    f? = { x => x * x }
    return
}
