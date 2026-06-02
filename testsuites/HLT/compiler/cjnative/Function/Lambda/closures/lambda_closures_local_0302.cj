/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

func case01() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    var goo = {
        => {
            =>
            var s = a.a;
            s
        }()
    }
    func foo(x: () -> Int32) {
        return x
    }
    var res = foo({
        => {
            =>
            var s = a.a;
            s
        }()
    })
    return {
        => {
            =>
            var s = a.a;
            s
        }()
    }
}

func case02() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    var goo = {
        => {
            =>
            var s = a.b;
            s
        }()
    }
    func foo(x: () -> Int32) {
        return x
    }
    var res = foo({
        => {
            =>
            var s = a.b;
            s
        }()
    })
    return {
        => {
            =>
            var s = a.b;
            s
        }()
    }
}

func case03() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    var goo = {
        => {
            =>
            var s = b.a;
            s
        }()
    }
    func foo(x: () -> Int32) {
        return x
    }
    var res = foo({
        => {
            =>
            var s = b.a;
            s
        }()
    })
    return {
        => {
            =>
            var s = b.a;
            s
        }()
    }
}

func case04() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    var goo = {
        => {
            =>
            var s = b.b;
            s
        }()
    }
    func foo(x: () -> Int32) {
        return x
    }
    var res = foo({
        => {
            =>
            var s = b.b;
            s
        }()
    })
    return {
        => {
            =>
            var s = b.b;
            s
        }()
    }
}

func case05() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    var goo = {
        => {
            =>
            var s = m;
            s
        }()
    }
    func foo(x: () -> Int32) {
        return x
    }
    var res = foo({
        => {
            =>
            var s = m;
            s
        }()
    })
    return {
        => {
            =>
            var s = m;
            s
        }()
    }
}

func case06() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    var goo = {
        => {
            =>
            var s = a;
            s
        }()
    }
    func foo(x: () -> Int32) {
        return x
    }
    var res = foo({
        => {
            =>
            var s = a;
            s
        }()
    })
    return {
        => {
            =>
            var s = a;
            s
        }()
    }
}

func case07() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    var goo = {
        => {
            =>
            var s = b;
            s
        }()
    }
    func foo(x: () -> Int32) {
        return x
    }
    var res = foo({
        => {
            =>
            var s = b;
            s
        }()
    })
    return {
        => {
            =>
            var s = b;
            s
        }()
    }
}

class Coo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}

struct Roo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}
// ASSERT: scan sema_func_capture_var_cannot_assign
// ASSERT: scan sema_func_capture_var_cannot_param
// ASSERT: scan sema_func_capture_var_cannot_return
// ASSERT: scan sema_mismatched_types
