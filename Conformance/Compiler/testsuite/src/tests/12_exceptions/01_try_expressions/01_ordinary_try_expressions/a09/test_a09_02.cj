/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a09_02

  @Level:         1

  @Assertion:    12.1.1(9) When all catchable exception types of a catch block can be caught by other catch blocks
                           defined before it, a "catch block unreachable" warning is given at the catch block. 

  @Description:  Checks that the warning will not be issued when some exception can be caught
                 with different try-with-resource catch-blocks.

  @Mode:         compileonly         

  @Negative:     no

  @Structure:    single

  @CompileWarning: no

*/

open class MyException <: Exception {}

public class TestA0902 <: Resource {
    public func isClosed() : Bool {
        return true
    }
    public func close() : Unit {}
}

main() {
    try (r = TestA0902()) {
        throw MyException()
    } catch (e: Exception) {
    } catch (_) {}
}
