/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: plugin_func_count.cj
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler -L $CANGJIE_STDX_PATH -lstdx.chir -lstdx.plugin.manager -lstdx --import-path $CANGJIE_STDX_PATH %compile_shared_lib_opt plugin_func_count.cj -o libplugin_func_count.%dylib_suffix
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH && %compiler %cmp_opt -Woff unused %f -o %output --plugin=./libplugin_func_count.%dylib_suffix 2>&1 | compare %f
// ASSERT: scan function count: 5\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// serialize 覆盖：泛型类/方法、局部函数、lambda、MemberVar 等编译器 IR 再序列化路径

class Box<T> {
    public var v: T
    public init(v: T) {
        this.v = v
    }
    public func get(): T {
        this.v
    }
}

func idGen<T>(x: T): T {
    x
}

func runLocal(): Int64 {
    func inner(x: Int64): Int64 {
        x + 1
    }
    let f = { y: Int64 => y + 2 }
    inner(1) + f(3)
}

main() {
    let b = Box(10)
    println(b.get() + idGen(1) + runLocal())
    0
}
