// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test() {
    let lambda1 = /*1*/ { /*2*/ a /*3*/ : Int /*4*/ => /*5*/
        f()
    }

    let lambda2 = /*1*/ { /*2*/ a /*3*/ : Int /*4*/ => // 5
        f()
    }

    let lambda2 = /*1*/ { /*2*/ a /*3*/ : Int // 4
        /*4*/ => // 5
        f() // 6
    }

    let lambda2 = /*1*/ { /*2*/ a /*3*/ : Int // 4
        /*4*/ => /*5*/ f() // 6
    }

    match (y) {
        case /*1*/ Some(_) /*2*/ => /*3*/ 5 /*4*/

        case /*1*/ Some(_) /*2*/ => /*3*/ 5 // 4

        case /*1*/ Some(_) // 2
            => /*3*/ 5 // 4

        case /*1*/ Some(_) // 2
            => //3
            5 // 4

        case /*1*/ Some(_) // 2
            => /*3*/ 5 // 4
    }
}
