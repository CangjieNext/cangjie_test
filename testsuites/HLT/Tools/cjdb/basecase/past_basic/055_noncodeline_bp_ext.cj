/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f1Ext() {
    println("f1 from file without main")
}

class AExt <: I {

    public func f(): Unit {
        println("AExt.fff")
    }

    public func f1Ext(): Unit {
        println("AExt.f1 from file without main")
    }
}

