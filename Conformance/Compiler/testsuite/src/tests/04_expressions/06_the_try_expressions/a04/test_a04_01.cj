/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_06_a04_01

  @Level:         1

  @Assertion: 4.6(4)
              The syntax of the try expression is defined as:

              tryExpression
                  : 'try' block 'finally' block
                  | 'try' block ('catch' '(' catchPattern ')' block)+ ('finally' block)?
                  | 'try' '(' resourceSpecifications ')' block ('catch' '(' catchPattern ')' block)* ('finally' block)?
                  ;

  @Description: Check the positive cases of 'tryExpression' production rule.

  @Mode: run

  @Negative: no

  @CompileWarning: Ignore
*/

import utils.assert.Assert

var isResourceFree = true

class GlobalResource <: Resource {
    init() {
        isResourceFree = false
    }

    public func isClosed() {
        isResourceFree
    }

    public func close() {
        isResourceFree = true
    }
}

//
// Rule: tryExpression = 'try' block 'finally' block
// Case: tryExpression = 'try' block 'finally' block
//
func test1() {
    var enter1 = false
    var exit1 = false
    var finally1 = false
    try {
        try {
            enter1 = true
            throw Exception("nobody expects the spanish inquisition")
            exit1 = true
        } finally {
            finally1 = true
        }
    } catch (_) {}
    Assert.isTrue(enter1)
    Assert.isFalse(exit1)
    Assert.isTrue(finally1)
}

//
// Rule: tryExpression = 'try' block ('catch' '(' catchPattern ')' block)+ ('finally' block)?
// Case: tryExpression = 'try' block 'catch' '(' catchPattern ')' block
//
func test2() {
    var enter1 = false
    var exit1 = false
    var catch1 = false
    try {
        enter1 = true
        throw Exception("nobody expects the spanish inquisition")
        exit1 = true
    } catch(e: Exception) {
        catch1 = true
    }
    Assert.isTrue(enter1)
    Assert.isFalse(exit1)
    Assert.isTrue(catch1)
}

//
// Rule: tryExpression = 'try' block ('catch' '(' catchPattern ')' block)+ ('finally' block)?
// Case: tryExpression = 'try' block 'catch' '(' catchPattern ')' block 'finally' block
//
func test3() {
    var enter1 = false
    var exit1 = false
    var catch1 = false
    var finally1 = false
    try {
        enter1 = true
        throw Exception("nobody expects the spanish inquisition")
        exit1 = true
    } catch(e: Exception) {
        catch1 = true
    } finally {
        finally1 = true
    }
    Assert.isTrue(enter1)
    Assert.isFalse(exit1)
    Assert.isTrue(catch1)
    Assert.isTrue(finally1)
}

//
// Rule: tryExpression = 'try' block ('catch' '(' catchPattern ')' block)+ ('finally' block)?
// Case: tryExpression = 'try' block 'catch' '(' catchPattern ')' block 'catch' '(' catchPattern ')' block
//
func test4() {
    var enter1 = false
    var exit1 = false
    var catch1 = false
    var catch2 = false
    try {
        enter1 = true
        throw Exception("nobody expects the spanish inquisition")
        exit1 = true
    } catch(e: ArithmeticException) {
        catch1 = true
    } catch(e: Exception) {
        catch2 = true
    }
    Assert.isTrue(enter1)
    Assert.isFalse(exit1)
    Assert.isFalse(catch1)
    Assert.isTrue(catch2)
}

//
// Rule:  tryExpression =
//            'try' '(' resourceSpecifications ')' block ('catch' '(' catchPattern ')' block)* ('finally' block)?
// Case:  tryExpression =
//            'try' '(' resourceSpecifications ')' block
//
func test5() {
    var enter1 = false
    var exit1 = false
    Assert.isTrue(isResourceFree)
    try {
        try (r = GlobalResource()) {
            enter1 = true
            Assert.isFalse(isResourceFree)
            throw Exception()
            exit1 = true
        }
    } catch (_) {}
    Assert.isTrue(isResourceFree)
    Assert.isTrue(enter1)
    Assert.isFalse(exit1)
}

//
// Rule:  tryExpression =
//            'try' '(' resourceSpecifications ')' block ('catch' '(' catchPattern ')' block)* ('finally' block)?
// Case:  tryExpression =
//            'try' '(' resourceSpecifications ')' block 'finally' block
//
func test6() {
    var enter1 = false
    var exit1 = false
    var finally1 = false
    Assert.isTrue(isResourceFree)
    try {
        try (r = GlobalResource()) {
            enter1 = true
            Assert.isFalse(isResourceFree)
            throw Exception("nobody expects the spanish inquisition")
            exit1 = true
        } finally {
            finally1 = true
        }
    } catch (_) {}
    Assert.isTrue(isResourceFree)
    Assert.isTrue(enter1)
    Assert.isFalse(exit1)
    Assert.isTrue(finally1)
}

//
// Rule:  tryExpression =
//            'try' '(' resourceSpecifications ')' block ('catch' '(' catchPattern ')' block)* ('finally' block)?
// Case:  tryExpression =
//            'try' '(' resourceSpecifications ')' block 'catch' '(' catchPattern ')' block
//
func test7() {
    var enter1 = false
    var exit1 = false
    var catch1 = false
    Assert.isTrue(isResourceFree)
    try (r = GlobalResource()) {
        enter1 = true
        Assert.isFalse(isResourceFree)
        throw Exception("nobody expects the spanish inquisition")
        exit1 = true
    } catch(e: Exception) {
        catch1 = true
    }
    Assert.isTrue(isResourceFree)
    Assert.isTrue(enter1)
    Assert.isFalse(exit1)
    Assert.isTrue(catch1)
}

//
// Rule:  tryExpression =
//            'try' '(' resourceSpecifications ')' block ('catch' '(' catchPattern ')' block)* ('finally' block)?
// Case:  tryExpression =
//            'try' '(' resourceSpecifications ')' block
//            'catch' '(' catchPattern ')' block
//            'catch' '(' catchPattern ')' block
//
func test8() {
    var enter1 = false
    var exit1 = false
    var catch1 = false
    var catch2 = false
    Assert.isTrue(isResourceFree)
    try (r = GlobalResource()) {
        enter1 = true
        Assert.isFalse(isResourceFree)
        throw Exception("nobody expects the spanish inquisition")
        exit1 = true
    } catch(e: ArithmeticException) {
        catch1 = true
    } catch(e: Exception) {
        catch2 = true
    }
    Assert.isTrue(isResourceFree)
    Assert.isTrue(enter1)
    Assert.isFalse(exit1)
    Assert.isFalse(catch1)
    Assert.isTrue(catch2)
}

main() {
    test1()
    test2()
    test3()
    test4()
    test5()
    test6()
    test7()
    test8()
}

