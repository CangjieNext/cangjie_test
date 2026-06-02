/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            bug_0006119
  @Assertion:       Calling enum with the same name and constructor

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Comment:         CompilerBug v0.38.2. Verified for the Spec v0.22.14
*/

enum E { E }

main() {
    let a = E
    let b = E.E
    let c = default.E.E
}
