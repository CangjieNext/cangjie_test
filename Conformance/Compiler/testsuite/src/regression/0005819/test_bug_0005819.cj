/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            bug_0005819
  @Assertion:       Wrong return type of main when throwing an exception

  @Description:     There is a compilation error "return type of 'main' is not 'Integer' or 'Unit'" which shouldn't be
                    there.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single
  @CompileWarning:  no

  @Comment:         Not a Bug (rejected by Huawei), so the test has been changed from positive to negative.
                    Compiler v0.35.6, v0.37.2, v0.38.2 and Spec v0.22.12, v0.22.13, v0.22.14
*/

main() {
    throw Exception()
}
