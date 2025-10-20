/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: mp, mp1
// EXEC: %compiler %cmp_opt mp1/test_imp.cj --output-type=dylib -o ./
// EXEC: %compiler %cmp_opt mp/test_com.cj -L . -lmp1 %compile_chir_opt -o ./
// EXEC: %compiler %cmp_opt mp/test_plat.cj -L . -lmp1 %compile_dylib_opt_cjmp -o ./
// ERRCHECK: %compiler %cmp_opt %f %link_cjmp -L . -lmp1 -o %output
// ASSERT: scan sema_undeclared_identifier

import mp.*

main() {
    if (C2().a == 1) {
        return 0
    }
    return 1
}
