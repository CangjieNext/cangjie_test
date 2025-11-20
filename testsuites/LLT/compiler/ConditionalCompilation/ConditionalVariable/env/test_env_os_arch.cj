// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %cmp_opt %n.cj -o %output
// EXEC:%run %run_opt %output %run_args
// (OHOS) scan aarch64-linux-ohos
// (not OHOS) scan not ohos

package b

// linux-x86_64 device target is x86_64-linux-gnu
@When[env != "ohos"]
class mc {
    func p() {
        println("not ohos")
    }
}

// harmonyOS real device target is aarch64-linux-ohos
@When[arch == "aarch64" && os == "Linux" && env == "ohos"]
class mc {
    func p() {
        println("aarch64-linux-ohos")
    }
}

main(): Int64 {
    var a = mc()
    a.p()
    return 0
}