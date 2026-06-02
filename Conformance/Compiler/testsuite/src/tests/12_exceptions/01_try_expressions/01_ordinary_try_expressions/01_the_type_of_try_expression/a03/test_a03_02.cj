/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_01_a03_02

  @Level:         1

  @Assertion:    12.1.1.1(3) 3. If the context does explicitly require a certain type, the try block and
                                each of the catch blocks (ifpresent) are required to be a subtype of the required type.
                                In this case, however, they are not required to have their least common super type. 

  @Description:  Checks the try & catch blocks are required to be a subtype of the required type.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

open class A {}
main() {
    let e1 : A = try {
        A()
    } catch(_){
        1.2
    }
}
