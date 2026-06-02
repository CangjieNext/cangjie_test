// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan '@Annotation' modifying non-'public' class is invisible at runtime
// ASSERT: scan class with '@Annotation' should have 'const' constructor
// ASSERT: scan '@Annotation' modifying non-'public' class is invisible at runtime
// ASSERT: scan '@Annotation' modifying non-'public' class is invisible at runtime
// ASSERT: scan '@Annotation' modifying non-'public' class is invisible at runtime
// ASSERT: scan class with '@Annotation' should have 'const' constructor


public enum AnnotaitionKind {
    | Type
    | Parameter
    | Init
    | MemberProperty
    | MemberFunction
    | MemberVariable
}

@Annotation[target: [Type, MemberFunction]]
class CustomAnnotation {}

@Annotation
class SubCustomAnnotation {}

@Annotation[target: []]
class MyAnno {}

main() {}


