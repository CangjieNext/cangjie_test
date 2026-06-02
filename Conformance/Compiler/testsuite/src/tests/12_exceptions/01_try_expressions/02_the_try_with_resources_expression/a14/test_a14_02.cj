/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a14_02

  @Level:         1

  @Assertion:    12.1.2(14) However, if it is necessary to explicitly catch and handle any exceptions
                            that may be thrown during a try block or resource request and release,
                            it is still possible to include catch blocks and a finally block 
                            in a try-with-resources expression:

  @Description:  Checks an example #1 for the try_with_resouce expression. 

  @Mode:         run

  @Negative:     no

  @Issue:        0006454

  @Structure:    single

*/

import std.io.*
import utils.assert.Assert

class MyResource <: Resource {
    var flag = false
    public func isClosed() { flag }
    public func close() { flag = true }
    public func hasNextLine() { false }
    public func readLine() { "line" }
    public func writeLine(_: String) {}
}

main() { 
    var c_block : Bool = false 
    var f_block : Bool = false 
    let e = try (input = MyResource(), 
        output = MyResource()) { 
        while (input.hasNextLine()) { 
            let lineString = input.readLine() 
            output.writeLine(lineString) 
        } 
        throw IOException()
    } catch (e: IOException) { 
        print("IOException happened when executing the try-with-resources expression") 
        c_block = true
    } finally { 
        print("end of the try-with-resources expression") 
        f_block = true
    }
    Assert.isTrue(c_block) 
    Assert.isTrue(f_block) 
}
