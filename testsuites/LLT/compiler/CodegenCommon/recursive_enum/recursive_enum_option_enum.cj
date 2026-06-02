// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

public enum E {
    A
    | B(S1)
    | C
}

public struct S1 {
    var aaa: Option<Option<Option<E>>> = Option<Option<Option<E>>>.None;
    init() {}
}

public class C1 {
    public var ccc: ??Option<E> = Option<Option<Option<E>>>.None;
    init() {
    }
}

main() {
    var bbb: Option<Option<E>> = Option<Option<E>>.Some(Option<E>.Some(C));
    0
}
