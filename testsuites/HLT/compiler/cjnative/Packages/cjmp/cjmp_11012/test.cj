/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: mp
// ERRCHECK: %compiler %cmp_opt mp/test_com.cj %compile_chir_opt -o ./
// ASSERT: scan sema_common_direct_extension_has_common_private_members

import mp.*

main() {
    if (C().f1() + C().f2() == 0) {
        return 0
    }
    return 1
}
