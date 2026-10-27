// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// A conditional extension (where clause) on a generic ancestor makes the subclass conform to the
// implemented interface only for those type arguments that satisfy the condition. The interfaces
// inherited by that interface must carry the same residual condition: otherwise the subclass is
// reported as conforming to the parent interface while failing the child interface.
//
// The current main satisfies this case; it guards the direction that a codegen change can newly
// break while collecting a conditional extension for an interface inherited through another
// interface (observed while fixing issue #702).

interface IParent {}

interface IChild <: IParent {}

interface IBound {}

open class A<T> {}

extend<T> A<T> <: IChild where T <: IBound {}

class B<U> <: A<U> {}

class Good <: IBound {}

main() {
    // B<Good> satisfies T <: IBound, so it conforms to IChild and therefore to IParent.
    let good: Object = B<Good>()
    if (!(good is IChild)) {
        return 1
    }
    if (!(good is IParent)) {
        return 2
    }
    // B<Int64> does not satisfy T <: IBound, so it conforms to neither interface.
    let bad: Object = B<Int64>()
    if (bad is IChild) {
        return 3
    }
    if (bad is IParent) {
        return 4
    }
    return 0
}
