/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum TimeUnit {
    One(Data)
}

class Data {
    public var time = TimeUnit.One(Data())
    public var data: Int32 = 2
}

main(): Int64 {
    var time = Data().time
    var res: Int32 = match (time) {
        case One(x) => x.data
        case _ => 5
    }

    if (res == 2) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_recursive_constructor_call
// ASSERT: scan sema_unreachable_pattern
