/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a01_01

  @Level:         1

  @Assertion:    12.1.2(1) Try-with-resources expressions are introduced mainly
                           for automatically releasing non-memory resources.

  @Description:  Checks that the resources are released for try-with-resource expression.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public class TestA0101 <: Resource {
    var res_closed : Bool = false
    public func isClosed() : Bool {
        return res_closed
    }
    public func close() : Unit {
        res_closed = true    
    }
}

main() {
// test case #1
    let res1 = TestA0101()
    let e1 = try (res = res1) {
        Assert.isFalse(res.isClosed())
    }
    Assert.isTrue(res1.isClosed())
// test case #2
    let res2 = TestA0101()
    let e2 = try (r = res2) {
        Assert.isFalse(res2.isClosed())
    } catch (_) {}
    Assert.isTrue(res2.isClosed())
// test case #3
    let res3 = TestA0101()
    let e3 = try (r = res3) {
        Assert.isFalse(res3.isClosed())
        throw Exception()
    } catch (_) {
        Assert.isTrue(res3.isClosed())
    }
    Assert.isTrue(res3.isClosed())
// test case #4
    let res4 = TestA0101()
    let e4 = try (r = res4) {
        Assert.isFalse(res4.isClosed())
    } finally {
        Assert.isTrue(res4.isClosed())
    }
}
