/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_01_a01_01

  @Level:         1

  @Assertion:    12.1.1.1(1) Similar to the if expressions, 
                 1. When try expression is not read or returned, then the type of the try expression is Unit,
                    and the try block and catch blocks are not required to have common supertype;
                    otherwise check types as below;


  @Description:  Checks that the type expression is Unit when the try expression is not read.

  @Mode:         run

  @Negative:     no

  @CompileWarning: Ignore

  @Structure:    single

  @Comment:      Cannot clearly check the result type of the try here because by the assert
                 we should not return or read it to the variable.

*/

main() {
// test case #1
    try {
    } catch(e: Exception) {}

// test case #2
    try {       
    } catch(e: Exception) {
    } catch(_) {}

// test case #3
    try {
        } catch(e: Exception) {
        } finally {}

// test case #4
    try {       
    } catch(e: Exception) {
    } catch(_) {
    } finally {}

// test case #5
    try {
        1
    } catch(e: Exception) {
        2
    }

// test case #6
    try {
        1
    } catch(e: Exception) {
        2.0
    }

// test case #7
    try {       
        1
    } catch(e: Exception) {
        "Hello"
    } catch(_) {
        2.1
    }

// test case #8
    try {       
        print("Hello")
    } catch(e: Exception) {
        1
    } catch(_) {
        0.5
    } finally {}

    0
}
