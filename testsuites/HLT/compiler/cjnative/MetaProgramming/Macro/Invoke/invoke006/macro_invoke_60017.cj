/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_macro test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output

import test.*

main() {
    print("result is ${@M(return 1)}")
    return 0
}

// ${...} is translated to (match(...)).toString(). The type Nothing does not implement the toString function.
// ASSERT: scan sema_undeclared_identifier
