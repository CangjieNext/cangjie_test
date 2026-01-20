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
// ERRCHECK: %compiler %cmp_opt mp/test_plat.cj %compile_dylib_opt_cjmp -o ./
// ASSERT: scan sema_cjmp_non_specific_abstract_member_in_specific_class

import mp.*

public class C4 <: C1 {
    public func f1(): Int64 { 1 }
    public prop p1: Int64 { get(){1} }
    public func f2(): Int64 { 1 }
    public prop p2: Int64 { get(){1} }
}

main() {
    if(C4().f1() + C4().p1 + C4().f2() + C4().p2 == 4) {
        return 0
    }
    return 1
}
