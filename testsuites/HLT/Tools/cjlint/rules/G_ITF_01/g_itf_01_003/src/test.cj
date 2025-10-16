interface I {
    mut func f(): Unit
}

struct R <: I {
    var item = 0
}

extend R {
    public mut func f(): Unit {
        item += 1
    }
}

main(){}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
