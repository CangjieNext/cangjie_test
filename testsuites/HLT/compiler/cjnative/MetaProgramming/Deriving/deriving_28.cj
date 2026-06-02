/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_unable_to_infer_generic_func
import std.deriving.*

@Derive[Hashable]
class A {
    let a = [1, 2, 3]
}

main() {
    var a = A()
    print(a.hashCode())
    if (a.hashCode() == -3390368810732495686) {
        return 0
    } else {
        return 1
    }
}
