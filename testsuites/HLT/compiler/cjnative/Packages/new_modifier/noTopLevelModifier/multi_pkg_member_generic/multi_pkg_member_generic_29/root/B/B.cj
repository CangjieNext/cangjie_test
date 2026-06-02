/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package root.B

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
