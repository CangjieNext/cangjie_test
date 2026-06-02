/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a14_03

  @Level:         1

  @Assertion:    12.1.2(14) However, if it is necessary to explicitly catch and handle any exceptions
                            that may be thrown during a try block or resource request and release,
                            it is still possible to include catch blocks and a finally block 
                            in a try-with-resources expression:

  @Description:  Checks an example #2 for the try_with_resouce expression. 

  @Mode:         compileonly

  @Negative:     no

  @Issue:        0006455

  @Structure:    single

*/
import std.io.*

class MyResource <: Resource {
    var flag = false
    public func isClosed() { flag }
    public func close() { flag = true }
    public func hasNextLine() { false }
    public func readLine() { "line" }
    public func writeLine(_: String) {}
}

main() { 
    try {
        var freshExc = None<Exception> // A fresh variable that could store any exceptions
        let input = MyResource()
        try {
            var freshExc = None<Exception>
            let output = MyResource()
            try {
                while (input.hasNextLine()) {
                    let lineString = input.readLine()
                    output.writeLine(lineString)
                }
            } catch (e: Exception) {
                freshExc = e
            } finally {
                try {
                    if (!output.isClosed()) {
                        output.close()
                    }
                } catch (e: Exception) {
                    match (freshExc) {
                        case Some(v) => throw v // Exception raised from the user code will be thrown
                        case None => throw e
                    }
                }
                match (freshExc) {
                    case Some(v) => throw v
                    case None => ()
                }
            }
        } catch (e: Exception) {
            freshExc = e
        } finally {
            try {
                if (!input.isClosed()) {
                    input.close()
                }
            } catch (e: Exception) {
                match (freshExc) {
                    case Some(v) => throw v
                    case None => throw e
                }
            }
            match (freshExc) {
                case Some(v) => throw v
                case None => ()
            }
        }
    } catch (e: Exception) {
        print("Exception happened when executing the try-with-resources expression")
    } finally {
        print("end of the try-with-resources expression")
    }
}
