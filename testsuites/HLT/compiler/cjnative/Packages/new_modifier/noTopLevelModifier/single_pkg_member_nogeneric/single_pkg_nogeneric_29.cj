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

public class BB {
    private var a: Int64
    protected init(temp: Int64) {
        a = temp
    }
    protected mut prop b: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}

protected var AA = BB(0)
public var aa = AA.b

main() {
    return aa
}
