// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct s<T1,T2,T3,T4,T5,T6,T7,T8,T9> {
    var member1: T1
    private var member2: T2
    private let member3: T3
    let member4: T4
    var member5: T5
    var member6: T6
    var member7: T7
    var member8: T8
    var member9: T9
    init(member1!: T1, member2!: T2, member3!: T3, member4!: T4, member5!: T5, member6!: T6, member7!: T7, member8!: T8, member9!: T9) {
        this.member1 = member1
        this.member2 = member2
        this.member3 = member3
        this.member4 = member4
        this.member5 = member5
        this.member6 = member6
        this.member7 = member7
        this.member8 = member8
        this.member9 = member9
    }
}
 
enum TimeUnit<T> {
    Month(T)
}
 
class A {
    var a = 10
}

struct B {
    var b = 20
}
 
main() {
    var a = s<TimeUnit<Int8>, TimeUnit<Int16>, TimeUnit<Int32>, TimeUnit<Int64>, TimeUnit<Unit>, TimeUnit<(Int32, Int64)>, TimeUnit<String>, TimeUnit<A>, TimeUnit<B>>(member1: TimeUnit.Month(8), member2: TimeUnit.Month(16), member3: TimeUnit.Month(32), member4: TimeUnit.Month(64), member5: TimeUnit.Month(()), member6: TimeUnit.Month((111, 222)), member7: TimeUnit.Month("HHH"), member8: TimeUnit.Month(A()), member9: TimeUnit.Month(B()))
    return 0
}