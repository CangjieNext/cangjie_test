/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class S {
    public static func sf(): Int64 {
        return 1
    }
    public static var sv: Int64 = 2
    protected static func sp(): Int64 {
        return sv + 1
    }
    public static func su(): Int64 {
        return sp()
    }
}

class T {
    public static var tv: Int64 = 6
    public static func tf(): Int64 {
        return 5
    }
}

main() {
    println(S.sf())
    println(S.su())
    println(S.sv)
    println(T.tf())
    println(T.tv)
}
