// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan unexpected annotation '@Annotation' on open
// ASSERT: scan unexpected annotation '@Annotation' on struct

import define.*

@Annotation
@M
open class B {}

@Annotation
@M
@M1
struct C {}

main() {}
