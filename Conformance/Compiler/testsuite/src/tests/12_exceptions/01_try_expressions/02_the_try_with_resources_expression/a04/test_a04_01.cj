/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a04_01

  @Level:         1

  @Assertion:    12.1.2(4) Note that both catch blocks and the finally block are optional
                           in a try-with-resources expression.

  @Description:  Checks that both catch & finally blocks are optional in the try_with_resource expressions. 

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

public class TestA0401 <: Resource {
    public func isClosed() : Bool {
        return true
    }
    public func close() : Unit {}
}

main() {
// test case #1
    let e1 = try (res = TestA0401()) {}

// test case #2
    let e2 = try (res = TestA0401()) {
                } catch (_) {} 

// test case #3
    let e3 = try (res = TestA0401()) {
                } finally {} 
}
