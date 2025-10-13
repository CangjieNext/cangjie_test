
internal import std.sort.*

struct A {
A(var ra!: Int32 = 0, let rb!: Int64 = 0){

}
}

var a1 = [A(ra:4,rb:1),A(ra:1,rb:1)]

main(): Int64 {

    a1.sortBy(comparator: {a, b => a.ra.compare(b.ra)}, stable: true)

    if(a1[0].ra==1 && a1[0].rb==1 && a1[1].ra==4 && a1[1].rb==1 ){
        return 0
    }

    return 1
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
