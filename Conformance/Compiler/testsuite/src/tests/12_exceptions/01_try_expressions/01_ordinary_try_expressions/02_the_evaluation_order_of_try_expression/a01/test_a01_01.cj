/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_02_a01_01

  @Level:         1

  @Assertion:    12.1.1.2(1) Moreover, the type of the finally block is always Unit,
                             regardless of the type of expressions in the block.  

  @Description:  Checks that the type of the finally block is always Unit.

  @Mode:         run

  @Negative:     no

  @CompileWarning: Ignore

  @Structure:    single

  @Comment:      Seems like we cannot clearly check the type of the finally expression.
                 So here is a check that different kind of finally works OK.

*/

open class A {}
open class B {}
main() {
// test case #1
    try{} finally{}
// test case #2
    try{} catch(_){} finally{}
// test case #3
    try{} finally{1}
// test case #4
    try{} catch(_){} finally{1}
// test case #5
    try{} finally{1.0}
// test case #6
    try{} catch(_){} finally{1.0}
// test case #7
    try{} finally{"bla-bla-bla"}
// test case #8
    try{} catch(_){} finally{"bla-bla-bla"}
// test case #9
    try{} catch(_){} finally{if (true) {"2.0"} else {2.0}}
// test case #10
    try{} catch(_){} finally{if (true) {A()} else {B()}}
}
