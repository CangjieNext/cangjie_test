/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class a {
    private var a = 0

    public open func other(): Bool {
        if (true) {
            true
        }else{
            false
        }
    }

    public open mut prop check: Int64 {
        get() {
            print("get\n")
            a
        }
        set(value) {
            print("set\n")
            a = value
        }
    }
}

main(){}
