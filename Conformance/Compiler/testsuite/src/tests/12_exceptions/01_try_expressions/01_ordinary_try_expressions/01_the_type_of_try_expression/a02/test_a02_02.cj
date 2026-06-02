/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_01_a02_02

  @Level:         1

  @Assertion:    12.1.1.1(2) 2. If the context does not explicitly require a certain type, the try block and
                                all catch blocks (if present) are required to have their least common super type,
                                which is also the type of the entire try expression. 

  @Description:  Checks the type expression will not be set correctly when the try & catch block
                 have no common supertype.

  @Mode:         compileonly

  @Negative:     yes

  @Issue:        0006288

  @CompileWarning: Ignore

  @Structure:    single

*/

main() {
    let e = try {
        1
    } catch(_) {
        1.0
    }
}