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

class B {}

@Derive[Hashable]
@DeriveOrder[a]
class A {
    var a = [111, 111]
}

main() {
    var a = A()
    if (a.hashCode() == -7046029254386353034) {
        return 0
    } else {
        return 1
    }
}
