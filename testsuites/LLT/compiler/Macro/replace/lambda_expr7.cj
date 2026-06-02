// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj
// EXEC: %compiler %cmp_macro macroFoo.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT : scan expected declaration here
internal import pkg1.*

@Baz
struct Data {
    var a = @Baz {x:Int32, y:Int32 => x+y}
}

var d = @Baz {=>3}

main() {
    var data = Data()
    var add = data.a(1,2)
    if (add != 3) {
        return 1
    }
    var dd = d()
    if (dd != 3) {
        return 1
    }
    return 0
}
