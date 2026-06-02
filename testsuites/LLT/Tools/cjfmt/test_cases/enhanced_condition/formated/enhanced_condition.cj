// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Int64 {
    // patterns
    if (let A <- b) {} // 对于大多数用例不需要关心if/else body，这里省略
    if (let A(value) <- b) {}
    if (let A(_) <- b) {}
    if (let A | B(value) <- b) {} // fails
    if (let A | B(_) <- b) {}
    if (let _ <- b) {}
    if (let a: Int64 <- b) {}

    // nested patterns
    if (let (Some(a), Some(b)) <- value) {}
    if (let (None, Some(Some(b))) <- value) {}

    // &&, || variables
    if (let A <- b && let B(_) <- b) {}
    if (let A <- b || let B(value) <- b) {} // fails
    if (let B(value) <- b && value > 0) {}
    if (c == 0 && let B(value) <- b && value > 0) {}
    if (c == 0 || let B(value) <- b && value > 0) {} // fails
    if ((c == 0 || a > 1) || let a <- 1) {}

    // precedence
    if ((a && b > c) && let c <- d) {}
    if (let a <- b && c > d) {}

    // sema
    let c = 3
    if (let a <- 1 && c) {} // invalid && on Bool and Int64
    if (c && let a <- -1) {} // invalid && on Int64 and Bool
    if (let a <- 1) {
        a
    } else {
        a // cannot find a
    }

    if (let a <- 1 && let a <- 2) {}
}
