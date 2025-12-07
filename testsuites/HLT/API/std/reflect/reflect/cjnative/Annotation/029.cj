/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f
// (not MAC) RUN-EXEC: %run %run_opt %output %run_args

@Annotation[target: []]
public class Annotation {
    public const init() {}
}

@Annotation[target: [Type]]
public class TypeAnnotation {
    public const init() {}
}

@Annotation[target: [Parameter]]
class ParamAnnotation {
    public const init() {}
}

@Annotation[target: [Init]]
class InitAnnotation {
    public const init() {}
}

@Annotation[target: [MemberProperty]]
class PropAnnotation {
    public const init() {}
}

@Annotation[target: [MemberFunction]]
class FuncAnnotation {
    public const init() {}
}

@Annotation[target: [MemberVariable]]
class MemberAnnotation {
    public const init() {}
}

main() {}
