// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public func genericsfun_c<T>(a: T) {
    func test_c<T>(a: T) {
        var gengricsvar = a
        return 0
    }
    var testa = test_c(a)
    return 0
}

main() {
    var vcptr = CPointer<Int8>()
    var vcfunc = CFunc<() -> Unit>(vcptr)
    genericsfun_c(vcfunc)
    return 0
}
