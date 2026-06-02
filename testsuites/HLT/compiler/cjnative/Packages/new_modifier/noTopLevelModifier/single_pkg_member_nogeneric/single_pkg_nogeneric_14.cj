/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan sema_invalid_access_control

protected class BB {
    private var a: Int64
    public init(temp: Int64) {
        a = temp
    }
    func foo(x: Int64): Int64 {
        return x
    }
}

protected var AA = BB(0)
public var aa = AA.a

main() {
    return aa |> AA.foo
}
