/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_a04_02

  @Level:         1

  @Assertion:    12(4) The exception handling mechanism is composed of the following components. 
                       - Try expressions, which include both ordinary try expressions
                         and try-with-resources expressions.

  @Description:  Check of try & try-with-resources expressions syntacsis.

  @Mode:         compileonly         

  @Negative:     no

  @Structure:    single

*/

class Res <: Resource {
    public func isClosed() : Bool {
        return true
    }
    public func close() : Unit {}
}
main() {
// test case #1
    try (res = Res()) {}
// test case #2
    try (res = Res()) {
    } catch (_) {}
// test case #3
    try (res = Res()) {
    } catch (_) {
    } finally {}
// test case #4
    try (res = Res()) {
    } finally {}
// test case #5
    try {
    } catch (_) {}
// test case #6
    try {
    } finally {}
// test case #7
    try {
    } catch (_) {
    } finally {}
}
