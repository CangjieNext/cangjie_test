/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_03_a05_03

  @Level:         1

  @Assertion:       4.4.3(5) The syntax of pattern guard is as follows.
                    patternGuard
                        : 'where' expression
                        ;

  @Description:     Check that match expression with a broken pattern guard (only 'where' without expression) won't
                    compile.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single
  @CompileWarning:  no

*/

main() {
    match (0) {
        case 0 where => ()
        case _ => ()
    }
}
