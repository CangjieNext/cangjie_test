/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_a06_01

  @Level:         1

  @Assertion:  17(6) If both a macro and an annotation with the same name exist 
               in the context of the code, the compiler should report an error. 

  @Description:  Check that compiler should report an error, if both a macro and an annotation 
                 with the same name exist in the context of the code.

  @Mode:         compileonly
  @Negative:     yes
  @Dependencies: aux_maxros_01.cj
  @Issue:        0006622

*/

import aux_macros_01.*

@Annotation
public class TestA0601 {
    public let version: String
    public const init() {
        this.version = "1.2.0"
    }
}

@Annotation1
class Foo {}

main() {}
