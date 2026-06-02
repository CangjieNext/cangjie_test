/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@Deprecated
interface I {
    prop a: Int64
    mut prop b: Int64
}

@Deprecated
class C <: I {
    private var value = 0
    @Deprecated
    public prop a: Int64 {
        get() {
            value
        }
    }
    @Deprecated
    public mut prop b: Int64 {
        get() {
            value
        }
        set(v) {
            value = v
        }
    }
}

main() {}
