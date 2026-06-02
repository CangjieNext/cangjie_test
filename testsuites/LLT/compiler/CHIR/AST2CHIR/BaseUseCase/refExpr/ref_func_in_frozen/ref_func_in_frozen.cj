// DEPENDENCE: ./pkg.cj
// EXEC-0:%compiler %cmp_opt %enableO2 %compile_lib_opt --no-sub-pkg pkg.cj -o ./pkg.%middle
// EXEC-0:%compiler %cmp_opt %enableO2 pkg.%middle %f -o %output
// EXEC-0: %run %output

import pkg.*

main() {
    let a = CA<Int64>()
    a.goo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
