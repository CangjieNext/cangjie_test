open class Base{
    public static func returnVal(){0}
}

open class Derive1 <: Base{
}

class Derive2 <: Derive1{
    private static func returnVal(){
        2
    }
}

main() {
    return Derive2.returnVal()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
