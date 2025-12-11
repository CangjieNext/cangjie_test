// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0: %frontendCompiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chir | compare %f
// (CJNATIVE and not Windows and DEBUG_OPTION) ASSERT: regex InvokeStatic

public interface I<T> {
    static func add(a: T): Int64
}

class A <: I<A> {
    public static func add(a: A): Int64 {
        return 1
    }
}

class B<T> where T <: I<T> {
    func foo(a: T) {
        // static call
        return T.add(a)
    }
}

main(): Int64 {
    var a = A()
    var b = B<A>()
    b.foo(a)
    return 0
}
