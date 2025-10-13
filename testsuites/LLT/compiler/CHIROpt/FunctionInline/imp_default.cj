// DEPENDENCE: %n.pkg.cj
// EXEC: %compiler %n.pkg.cj -O2 %compile_lib_opt -o libp1.%lib_extension
// EXEC: %compiler %f libp1.%lib_extension -O2 %debugCHIROpt | compare %f

import p1.*

main() {
    foo()
}
// ASSERT: scan The Apply node in the line:8 and the column:5, was optimized by Function Inline


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
