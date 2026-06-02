/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a12_01

  @Level:         1

  @Assertion:    12.1.1(12) The finally block always executes after evaluating the try block and the catch blocks,
                            no matter whether an exception is thrown or not. 

  @Description:  Checks the finally block always executes after evaluating the try block and the catch blocks. 

  @Mode:         run         

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
import std.ast.*

main(ina :Array<String>)  {
    let rtz : Bool = Assert.getRuntimeZero(ina) == 0
    var try_block    = false 
    var catch_block   = false
    var finally_block = false
// test case #1
    let arr_1 : Array<Int32> = [0, 1, 2]
    var res_1 : Array<Int32> = [0, 0, 0] 
    try {
        try_block = true
        var ind = 2
        while (ind >= 0) {
            res_1[ind] = arr_1[ind] / arr_1[ind]
            ind--
        }
    } catch (e: ArithmeticException) {
        catch_block = true
    } finally {
        Assert.equals(true, try_block)     
        Assert.equals(true, catch_block)
        finally_block = true
    }
    Assert.equals(true, finally_block)
// test case #2
    try_block = false
    finally_block = false
    let arr_2 : Array<Int32> = [0, 1, 2]
    var res_2 : Array<Int32> = [0, 0, 0]
    try {
        try_block = true
        var ind = 2
        while (ind > 0) {
            res_2[ind] = arr_2[ind] / arr_2[ind]
            ind--
        }
    } finally {
        Assert.equals(true, try_block)     
        finally_block = true
    }
    Assert.equals(true, finally_block)
// test case #3
    catch_block = false
    finally_block = false
    try {
        throw IndexOutOfBoundsException()
    } catch (e: IndexOutOfBoundsException) {
        catch_block = true
    } finally {
        Assert.equals(true, catch_block)     
        finally_block = true
    }
    Assert.equals(true, finally_block)
// test case #4
    try_block = false
    catch_block = false
    finally_block = false
    var tks = Tokens()
    tks += Token(TokenKind.NL)
    try {
        try_block = true
        @When[backend == "cjnative"]
        func foo(): Unit{
            throw SpawnException()
        }

        foo()
    } catch (e: StackOverflowError) {
        catch_block = true
    } catch (e: SpawnException) {
        catch_block = true
    } finally {
        Assert.equals(true, try_block)     
        finally_block = true
    }
    Assert.equals(true, finally_block)
// test case #5
    try_block = false
    catch_block = false
    finally_block = false
    try {
        try {
            throw ArithmeticException()    
        } catch (_) {
            catch_block = true
        } finally {
            Assert.equals(true, catch_block)     
            finally_block = true
        }
        Assert.equals(true, finally_block)
        try_block = true
        if (rtz) {
            throw ArithmeticException()
        }
        try_block = false
        finally_block = false
    } catch (_) {
        catch_block = true
    } finally {
        Assert.equals(true, catch_block)     
        Assert.equals(true, try_block)     
        finally_block = true
    }
    Assert.equals(true, finally_block)
// test case #6
    try_block = false
    catch_block = false
    finally_block = false
    try {
        try {
            let arr_6 : Array<Int32> = [0, 1, 2]
            var res_6 : Array<Int32> = [0, 0, 0]
            var ind = 2
            while (ind >= 0) {
                res_6[ind] = arr_6[ind] / arr_6[ind]
                ind--
            }
        } catch (_) {
            catch_block = true
        } finally {
            Assert.equals(true, catch_block)     
            finally_block = true
        }
        Assert.equals(true, finally_block)
        try_block = true
        finally_block = false
        try_block = true
        @When[backend == "cjnative"]
        func foo(): Unit{
            throw SpawnException()
        }

        foo()
        try_block = false
    } catch (e: StackOverflowError) {
        catch_block = true
    } catch (e: SpawnException) {
        catch_block = true
    } finally {
        Assert.equals(true, catch_block)     
        Assert.equals(true, try_block)     
        finally_block = true
    }
    Assert.equals(true, finally_block)
}
