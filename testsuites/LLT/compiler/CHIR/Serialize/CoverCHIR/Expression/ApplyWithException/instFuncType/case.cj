open class C {
    let c: Int64
    init(c: Int64){
        this.c = c
    }
}
open class D <: C {
    let d: Int64
    init(c: Int64, d: Int64){
        super(c)
        this.d = d
    }
}
class E <: D {
    let e: Int64
    init(e: Int64, c: Int64, d: Int64){
        super(c, d)
        this.e = e
    }
}

main () {
    let x = try {
        E(1,2,3)
    } catch (e: Exception) {
        D(1,2)
    } finally {
        C(1)
    }
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
