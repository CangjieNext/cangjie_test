public func genericsfun_int<T, T1>(a: T, b: T1): T {
    var gengricsvar = a
    var gengricsvar1 = b
    return gengricsvar
}

public func genericsfun_int<T, T1, T2>(a: T, b: T1, c: T2) {
    var gengricsvar = a
    var gengricsvar1 = b
    var gengricsvar2 = c
    return gengricsvar2
}


public func genericsfun_int(a: Int64, b: Int64): Int64 {
    var gengricsvar = a
    var gengricsvar1 = b
    return gengricsvar1
}


main() {
    var a = genericsfun_int(1,2)
    var b = genericsfun_int<Int64,Int32>(1,2)
    var c = genericsfun_int(1,2.0,true)
    0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */