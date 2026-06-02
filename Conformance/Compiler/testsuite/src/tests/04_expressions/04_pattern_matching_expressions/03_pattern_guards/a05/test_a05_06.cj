/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_03_a05_06

  @Level:         1

  @Assertion:       4.4.3(5) The syntax of pattern guard is as follows.
                    patternGuard
                        : 'where' expression
                        ;

  @Description:     Check that for-in expression with a broken pattern guard (no the 'where' keyword) won't compile.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single
  @CompileWarning:  no

*/

func f(_: Bool) { true }

main() {
    for (_ in [0] (false |> f)) {}
}
