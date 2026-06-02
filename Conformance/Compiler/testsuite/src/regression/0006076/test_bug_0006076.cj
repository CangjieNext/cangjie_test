/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            bug_0006076
  @Assertion:       Non-obvious tuple pattern matching behavior

  @Description:     If the pattern (_, 0) is used in the case section, there is no warning, but there is one for the
                    pattern (0, _).

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Comment:         CompilerBug v0.38.2. Verified for the Spec v0.22.12, v0.22.13, v0.22.14
*/

main() {
    let test = (1, 1)
    match(test) {
        case(0, _) => ()
        case _ => ()
    }
}
