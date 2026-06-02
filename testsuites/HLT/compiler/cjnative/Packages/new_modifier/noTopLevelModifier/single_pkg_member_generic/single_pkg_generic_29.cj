/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public class BB<T> {
    private var a: T
    protected init(temp: T) {
        a = temp
    }
    protected mut prop b: T {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}

protected var AA = BB<Int64>(0)
public var aa = AA.b

main() {
    return aa
}
