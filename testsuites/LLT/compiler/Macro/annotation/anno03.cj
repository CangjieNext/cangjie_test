// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan unexpected annotation '@Annotation' on var
// ASSERT: scan unexpected annotation '@Annotation' on interface
// ASSERT: scan unexpected annotation '@Annotation' on enum
// ASSERT: scan unexpected annotation '@Annotation' on struct
// ASSERT: scan unexpected annotation '@Annotation' on func
// ASSERT: scan unexpected annotation '@Annotation' on extend
// ASSERT: scan unexpected annotation '@Annotation' on main

@Annotation
public var a = 1

@Annotation
interface A {}

@Annotation
enum B { b }

@Annotation
@M
struct C {}

@M
@Annotation
func D() {}

@Annotation
extend A {}

@Annotation
main() {}
