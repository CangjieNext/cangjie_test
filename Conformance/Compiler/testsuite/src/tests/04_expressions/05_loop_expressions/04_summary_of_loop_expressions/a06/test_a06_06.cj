/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_04_a06_06

  @Level:         1

  @Assertion: 4.5.4(6) if there is no such outer loop, then an error is raised
  @Description: Check that 'continue' causes error if does not occur inside loop
  @Mode: compileonly
  @Negative: yes

*/

func f () {
    continue
}

main() {
    while (true) {
        f()
    }
}
