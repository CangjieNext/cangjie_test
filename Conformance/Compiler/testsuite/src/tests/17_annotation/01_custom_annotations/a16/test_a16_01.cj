/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_01_a16_01

  @Level:         1

  @Assertion:  17.1(16) Custom annotations can limit where they can be used to minimize misuse by developers, 
               and such annotations need to be declared with a target parameter in the @Annotation declaration.

  @Description:  Check that it is possible to limit the use of the annotation
  @Mode:         compileonly
  @Negative:     yes
  @Issue:        0006622

*/

@Annotation [target: [MemberFunction]]
public class TestA1601 {
    public const init() {}
}

@CustomAnnotation
class Foo {}

main() {
    obj = Foo()
}
