/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_01_a01_02

  @Level:         1

  @Assertion:    12.1.1.1(1) Similar to the if expressions, 
                 1. When try expression is not read or returned, then the type of the try expression is Unit,
                    and the try block and catch blocks are not required to have common supertype;
                    otherwise check types as below;


  @Description:  Checks the type of try expression is Unit when it is returned
                 and its try & catch blocks have no common super type.

  @Mode:         run

  @Negative:     no

  @Issue:        0006288

  @CompileWarning: Ignore

  @Structure:    single

*/

main() {
    try {
        1
    } catch(_) {
        1.0
    }

    return
}

