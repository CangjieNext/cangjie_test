/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a16_02

  @Level:         1

  @Assertion:    12.1.2(16) The type of try-with-resource expression is Unit.

  @Description:  Checks that the type of try-with-resource expression is Unit
                 when the try & catch blocks use different types of expressions.. 

  @Mode:         run

  @Negative:     no

  @CompileWarning: Ignore

  @Structure:    single

*/

import utils.assert.Assert

public class TestA1602 <: Resource {
    public func isClosed() : Bool {
        return true
    }
    public func close() : Unit {}
}

main() {
    let e = try (r = TestA1602()) {
        1
    } catch (_) {
        "bla-bla-bla"
    }
    Assert.isTrue(e is Unit)
}
