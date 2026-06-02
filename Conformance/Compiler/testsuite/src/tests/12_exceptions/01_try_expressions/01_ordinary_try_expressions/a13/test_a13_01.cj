/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a13_01

  @Level:         1

  @Assertion:    12.1.1(13)  catchPattern has two patterns: 
                             - A wildcard pattern (_) catches any type of exception, which equivalents to having
                             e: Exception in the type pattern (see below). That is to say, the wildcard pattern
                             can match instances of class Exception and that of its subclasses.

  @Description:  Checks that the wildcard pattern can match instances of class Exception and that of its subclasses.

  @Mode:         run         

  @Negative:     no

  @Structure:    single

  @CompileWarning: ignore

*/

import utils.assert.Assert
import std.ast.*

open class MyException <: Exception {}
main() {
    var catch_block : Bool
// test case #1
    catch_block = false
    try {
        throw Exception()
    } catch (_) {
        catch_block = true
    } catch (e: Exception) {
       Assert.fail()
    }
    Assert.equals(true, catch_block)
// test case #2
    catch_block = false
    try {
        throw MyException()
    } catch (_) {
        catch_block = true
    } catch (e: MyException) {
       Assert.fail()
    }
    Assert.equals(true, catch_block)
// test case #3
    let myArray : Array<Float64> = [1.0f64]
    catch_block = false
    try {
        for (ind in [0, 1]) {
            myArray[ind]
        }        
    } catch (_) {
        catch_block = true
    }
    Assert.equals(true, catch_block)
// test case #4
    // wildcard pattern cannot catch the Error exception.
    var tks = Tokens()
    try {
        @When[backend == "cjnative"]
        func foo(): Unit{
            throw SpawnException()
        }

        foo()
        
    } catch (e: StackOverflowError) {
        
    } catch (e: SpawnException) {

    } catch (_) {
        Assert.fail()
    } 

    return 0
}
