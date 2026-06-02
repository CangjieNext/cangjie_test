// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg.cj
// EXEC-PIPE-0:%compiler %enableO2 pkg.cj %compile_lib_opt -o pkg.%middle
// EXEC-PIPE-0:%compiler %enableO2 pkg.%middle %f -o %output
// RUN-EXEC-PIPE-0: %run %output

import pkg.*

main() {
    if (I1.prop_v5 == 5) {
        return 0
    } else {
        return 1
    }
}
