/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
open class Base {
    var name = "zhangsan"
}

class Base1 <: Base {
    var age = 10
}

class Base2 <: Base {
    var gender = "male"
}

let base1: Base1 = Base1()
let base01: Base1 = Base1()

class A {
    let b = Some(B(base1))
}

class B {
    var c = base01
    init(x: Base1) {
        this.c = x
    }
}

let t = (Some(B(base1)), 300)
let f = {i: Int64 => Some(B(base1))}
let g = {i: (Int64) -> Base1 => Some(B(i(2)))}

main() {
    var oa = Some(A())
    var ob = Some(t)
    var oc = Some(f)
    var od = Some(g)
    let m = oa?.b?.c as Base
    let n = ob?[0]?.c as Base
    let k = oc?(110)?.c as Base
    let l = od? {i: Int64 => base1}?.c as Base
    if ((m?.name ?? "name") == "zhangsan" || (n?.name ?? "name") == "zhangsan" || (k?.name ?? "name") == "zhangsan" ||
        (l?.name ?? "name") == "zhangsan") {
        return 1
    }
    return 0
}
