/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: mp
// EXEC: %compiler %cmp_opt mp/test_com.cj %compile_chir_opt -o ./
// EXEC: %compiler %cmp_opt mp/test_plat.cj %compile_dylib_opt_cjmp -o ./
// ERRCHECK: %compiler %cmp_opt %f %link_cjmp -o %output
// ASSERT: scan-2 sema_not_member_of

import mp.*

main() {
    return f1() + f2() + Some(B<Int64>(1)).foo1(B<Int64>(1)) + Option<B<Int64>>.foo2(B<Int64>(1)) - 12
}
