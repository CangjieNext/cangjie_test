/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan sema_accessibility_with_main_hint

internal class BB<T> {
    public var a: T
    internal init(temp: T) {
        a = temp
    }
}

protected var AA = BB<Int64>(0)
public var aa = AA.a

main() {
    return aa
}
