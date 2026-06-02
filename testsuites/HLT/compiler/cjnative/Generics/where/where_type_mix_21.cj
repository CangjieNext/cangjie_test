/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class Aoo<T> where T <: Range<Int32> & Object {
    public var a: T
    public init(x: T) {
        a = x
    }
}

main() {
    var a = Aoo<Range<Int32>>(0..2 : 1)
    if (a.a != (0..2 : 1)) {
        return 1
    }
    return 0
}

// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
