/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_a05_01

  @Level:         1

  @Assertion:  17(5) If both ways of processing are uncuccessful, a compilation error should be reported.  

  @Description:  Check that there will be a compilation error if the compiler cannot handle as a macro 
                 and as an annotation
  @Mode:         compileonly
  @Negative:     yes
  @Issue:        0006622

*/

@Annotation1[1.5]
class Foo {}

main() {}
