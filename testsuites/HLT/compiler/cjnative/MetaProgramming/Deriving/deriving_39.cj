/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan NoneValueException
import std.deriving.*

@Derive[ToString]
open class B<T> {
    var test = 1
}

@Derive[ToString]
@DeriveOrder[T]
enum A {
    T
}

main() {
    return 1
}
