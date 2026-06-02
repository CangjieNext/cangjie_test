/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a09_01

  @Level:         1

  @Assertion:    12.1.2(9) If all resources are successfully requested, execution continues
                           with the block immediately following try.

  @Description:  Checks that the execution of try-with-expression will be continued
                 with the block immediately following try.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public class TestA0901 <: Resource {
    var res_closed : Bool = false
    public func isClosed() : Bool {
        return res_closed
    }
    public func close() : Unit {
        res_closed = true    
    }
}

main() {
    var sequence = 0

// test case #1
    let e1 = try (r1 = TestA0901(), r2 = TestA0901(), r3 = TestA0901()) {
        sequence = 1    
    }
    Assert.equals(1, sequence)

// test case #2
    sequence = 0
    let e2 = try (r1 = TestA0901(), r2 = TestA0901(), r3 = TestA0901()) {
        sequence = 1    
    } catch (_) {
        sequence += 2    
    }
    Assert.equals(1, sequence)

// test case #3
    sequence = 0
    let e3 = try (r1 = TestA0901(), r2 = TestA0901(), r3 = TestA0901()) {
        sequence = 1    
    } finally {
        sequence += 3    
    }
    Assert.equals(4, sequence)

// test case #4
    sequence = 0
    let e4 = try (r1 = TestA0901(), r2 = TestA0901(), r3 = TestA0901()) {
        sequence = 1
        throw Exception()
    } catch (_) {
        sequence += 2    
    } finally {
        sequence += 3    
    }
    Assert.equals(6, sequence)
}
