/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_02_a04_01

  @Level:         1
  @Assertion:    2.2.1.2 (4)For example:
    func access() {
        let array8 = [1, 8, 0, 1, 0]
        for (num in array8) {
            print("${num}") // output: 18010
        }
    }

  @Description:  Checks that example from the spec works

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

main(): Int64 {
    func access() {
        let array8 = [1, 8, 0, 1, 0]
        for (num in array8) {
            print("${num}") // output: 18010
        }
    }
    access()

    return 0
}
