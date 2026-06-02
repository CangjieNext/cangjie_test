/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a16_01

  @Level:         1

  @Assertion:    12.1.2(16) The type of try-with-resource expression is Unit.

  @Description:  Checks that the type of try-with-resource expression is Unit. 

  @Mode:         run

  @Negative:     no

  @CompileWarning: Ignore

  @Structure:    single

*/

import utils.assert.Assert

public class TestA1601 <: Resource {
    public func isClosed() : Bool {
        return true
    }
    public func close() : Unit {}
}

main() {
    let e = try (r = TestA1601()) {
        1
    } catch (_) {
        2
    }
    Assert.isTrue(e is Unit)
}
