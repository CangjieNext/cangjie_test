/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package root.B

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
