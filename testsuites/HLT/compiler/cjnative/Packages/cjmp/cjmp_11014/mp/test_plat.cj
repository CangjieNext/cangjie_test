/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform struct C {}

platform extend C {
    public platform mut prop p1:Int64{
        get(){1}
        set(v){v}
    }
    public platform mut func f1():Int64{
        v1 = 1
        1
    }
}
