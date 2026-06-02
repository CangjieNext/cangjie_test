/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum Option<T> {
    Some(T) | None
}

class C {
    public var item: Int64 = 100
}

main() {
    let c = C()
    let c1 = Option<C>.Some(c)
    let c2 = Option<C>.None
    let r1 = c1?.item
    let r2 = c2?.item
    return 0
}
// ASSERT: scan sema_optional_chain_non_optional
