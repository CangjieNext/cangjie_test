/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f1(a:String):String {
    a
}
func f2<T>(a:String,b:T):T {
    b
}

main() {
    var a1 = f1("a: String")
    var a2 = f2<Int64>("a: String", 1)
    0
}
