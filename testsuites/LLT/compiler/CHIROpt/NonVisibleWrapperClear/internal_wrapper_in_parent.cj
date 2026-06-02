// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p2
// EXEC:%compiler %cmp_opt %compile_lib_opt --no-sub-pkg %pkg_opt p2 -o ./p2.%middle
// EXEC:%compiler %cmp_opt p2.%middle %f -o %output
// EXEC: %run %output

import p2.*

class cc <: cb {}

main() {
    let a = cc()
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
