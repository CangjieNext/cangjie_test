/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public trait Num {
    func Data(a: This, b: Int64): This
}

append Int64 with Num{
    func Data(a:Int64,b:Int64):Int64{
        return a*2
    }
}