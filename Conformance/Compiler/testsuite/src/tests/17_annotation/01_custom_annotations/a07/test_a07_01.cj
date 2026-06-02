/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_01_a07_01

  @Level:         1

  @Assertion:  17.1(7) Annotation information needs to be generated at compile time to bind the information to the
               type, and custom annotations must be constructed with a legal instance using const init at the 
               time of use.

  @Description:  Check that an annotation without a constructor will generate an error
  @Mode:         compileonly
  @Negative:     yes
  @Issue:        0006622

*/

@Annotation
public class TestA0701 {}

@TestA0701
class Foo {}

main() {}
