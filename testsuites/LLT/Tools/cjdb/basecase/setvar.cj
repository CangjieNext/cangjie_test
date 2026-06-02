// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    var val_ge2 = TimeUnit1<UInt32, Float32>.fun_s1(3.12) //static
    return 0
}

enum TimeUnit1<X, Y> {
    | Month(X)
    | Year(X)

    public func f1(par_1: X) {
        var var_m1 = par_1
        let var_m2 = par_1
        return var_m1
    }

    public static func fun_s1(par_1: Y) {
        var var_s1 = par_1
        return var_s1
    }
}
