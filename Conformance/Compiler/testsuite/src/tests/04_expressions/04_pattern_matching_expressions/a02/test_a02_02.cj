
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a02_02

  @Level:         1

  @Assertion: 4.4(2) Intuitively, a pattern represents a set of instances that 
              exhibit the pattern. 
  @Description: Checks that compile error appears when pattern set is missing.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    let l1 = 1;
    match (l1) { 
        case => 1
    }

    return
}
