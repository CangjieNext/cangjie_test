/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_01_a19_01

  @Level:         1

  @Assertion:  17.1(19)
                public enum AnnotaitionKind {
                    |Type
                    |Parameter
                    |Init
                    |MemberProperty
                    |MemberFunction
                    |MemberVariable
                }

                @Annotation [target: [Type, MemberFunction]]
                class CustomAnnotation {}

                @Annotation
                class SubCustomAnnotation {}

                @Annotation [target: []]
                class MyAnno {}
                This custom annotation can be used in all of the above positions when the target is not qualified. 
                When target is qualified, it can only be used in the list of declarations.

  @Description:  Check example
  @Mode:         compileonly
  @Negative:     no
  @Issue:        0006622

*/

@Annotation [target: [Type, MemberFunction]]
public class CustomAnnotation {
  const init() {}
}

@Annotation
public class SubCustomAnnotation {
  const init() {}
}

@Annotation [target: []]
public class MyAnno {
  const init() {}
}

main() {}
