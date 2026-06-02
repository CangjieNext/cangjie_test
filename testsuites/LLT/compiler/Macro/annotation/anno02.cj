// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan unexpected annotation '@Annotation' on abstract
// ASSERT: scan unexpected annotation '@Annotation' on open
// ASSERT: scan unexpected annotation '@Annotation' on sealed

@Annotation
abstract class A {}

@Annotation
open class B {}

@Annotation
sealed class C {}

main() {} 

