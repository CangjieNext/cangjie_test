/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_01_a17_01

  @Level:         1

  @Assertion:  17.1(17) Positions that can be restricted include:
                Type declarations (class, struct, enum, interface)
                Parameters in member functions/constructors
                Constructor declarations
                Member function declarations
                Member variable declarations
                Member property declarations

  @Description:  Check that it is possible to declare an annotation with a target from AnnotaitionKind
  @Mode:         compileonly
  @Negative:     no
  @Issue:        0006622

*/

@Annotation [target: [Type]]
public class TypeAnnotation {
    public const init() {}
}

@Annotation [target: [Parameter]]
public class ParamAnnotation {
    public const init() {}
}

@Annotation [target: [Init]]
public class InitAnnotation {
    public const init() {}
}

@Annotation [target: [MemberProperty]]
public class PropAnnotation {
    public const init() {}
}

@Annotation [target: [MemberFunction]]
public class FuncAnnotation {
    public const init() {}
}

@Annotation [target: [MemberVariable]]
public class MemberAnnotation {
    public const init() {}
}

main() {}
