/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

main(): Int64 {
    return 0
}

var m: Int32 = 1

public func case01() {
    var a: Coo = Coo()
    {
        =>
        var res = a.b + m;
        res
    }()
    var m: Int32 = 2
}

class Coo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}

struct Roo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}
// ASSERT: scan sema_capture_has_shadow_variable
// ASSERT: scan chir_dce_unused_variable
