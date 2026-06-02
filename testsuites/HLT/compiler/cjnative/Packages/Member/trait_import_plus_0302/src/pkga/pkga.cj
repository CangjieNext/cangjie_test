/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public trait Color {
    func addcolor(a: This,b:Int64):This
}

append String with Color {
    func addcolor(a: String,b:Int64): String {
        return a+b.toString()
    }
}

public var a:String = "a"