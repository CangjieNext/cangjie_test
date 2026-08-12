/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC-0: %compiler %enableO2 %cmp_opt -Woff=all %n.cj -o %output --mock=on 2>&1
// EXEC-0: %run %run_opt %output %run_args 2>&1

main(): Int64 {
    C<Unit>()
    return 0;
}

public open class C<T> {
    private static var v : Unit = ()
    init() {
        v
    }
}
