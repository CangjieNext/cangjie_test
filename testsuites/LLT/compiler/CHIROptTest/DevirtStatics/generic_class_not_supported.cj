// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %dumpCHIRDebug %enableO2 -Woff all %f %compile_lib_opt -o %n.%middle
// (Linux) EXEC: %cat %n\_CHIR/[0-9]*_Devirtualization.chirtxt | compare %f
// (Linux) ASSERT: regex InvokeStatic\(Class-_CN7default.*A1.*->@_CN7default.*foo.*
// (Linux) ASSERT: regex-not Apply\(Class-_CN7default.*A1.*->@_CN7default1A.*foo.*

public interface A {
    static func foo(iters: Int64): Int64
    static func bar(): Int64 {
        return foo(10000)
    }
}

public class A1<T> <: A {
    // this call to foo need to be devirtualized after bar is inlined
    // but it will not as generic classes are not supported
    public static func foo(iters: Int64): Int64 {
        // inflate the size of function to make inlining unviable
        let m = iters
        let p = 1000 * 1000 * 1000 + 7
        var x = p
        if (iters == 0) {
            return x + 1
        }
        var s = p % m
        while (s != 0) {
            s = (s + p) % m
            x ^= x << 13
            x ^= x >> 7
            x ^= x << 17
            x ^= x << 19
            x ^= x >> 11
            x ^= x << 17
            x ^= x << 3
            x ^= x >> 11
            x ^= x << 7
            x ^= x << 5
            x ^= x >> 23
            x ^= x << 9
        }
        x + 1
        return x
    }
}

public func genericFunc<T>(): Int64 {
    return A1<T>.bar()
}
