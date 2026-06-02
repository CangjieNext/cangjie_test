/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_04_a06_03

  @Level:         1

  @Assertion: 4.5.4(6) if there is no such outer loop, then an error is raised
  @Description: Check that loop does not cross function boundaries
  @Mode: compileonly
  @Negative: yes

*/

main() {
    for (x in 1..10) {
        func inner () {
            break
        }
        inner()
    }
}
