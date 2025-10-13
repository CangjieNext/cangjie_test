/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A {
    A(var a: Int64) {
    }
}

class B<T> where T <: A {
    B(var b: T) {
    }
}

// interface I<T>{
//   static func foos<T>(a: T){
//   }

//   static prop pas : B<A>{
//     get(){
//       B<A>(A(1))
//     }
//   }
// }

extend Nothing {
    func foo<T>(a: T) {
        return a
    }

    prop pa: B<A> {
        get() {
            B<A>(A(-1))
        }
    }

    static func foos<T>(a: T) {
        return a
    }

    static prop pas: B<A> {
        get() {
            B<A>(A(1))
        }
    }
}

main() {
    // var a = return
    Nothing.foos(1)
    return 0 //Nothing.foos(1)// + Nothing.pas.b.a
}
