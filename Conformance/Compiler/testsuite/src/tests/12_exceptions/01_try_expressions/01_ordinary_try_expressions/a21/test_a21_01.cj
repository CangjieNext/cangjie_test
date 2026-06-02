/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a21_01

  @Level:         1

  @Assertion:    12.1.1(21)  Furthermore, a wildcard pattern _ can be used to replace identifier in the type pattern. 

  @Description:  Checks that the wildcard pattern can replace the exception identifier in the type pattern.

  @Mode:         run         

  @Negative:     no

  @Structure:    single

*/

open class Exc <: Exception {}
main() {
// test case #1
    try {
        throw Exc()
    } catch (_) {
    }
// test case #2
    try {
        func bar0() : Int64 {
            return 0
        }
        func bar1() : Int64 {
            return 1
        }
        let v = bar1() / bar0()
    } catch (_) {
    }
}
