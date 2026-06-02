/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// cj code
foreign func cfoo_1(): Int32
foreign func run_callback(cb: CFunc<() -> Int32>): Int32

@FastNative
foreign func cfoo_2(): Int32

@C
func cjfoo_1(): Int32 {
    println("cjfoo_1")
    return 0
}


@C
func cjfoo_2(): Int32 {
    println("cjfoo_2")
    return 0
}

unsafe main() {
    /************ 1. direct call ************/
    // case 1.1: direct call a foreign func
    cfoo_1()

    // case 1.2: direct call a cangjie @C func
    cjfoo_1()

    /************ 2. indirect call ************/
    var f: CFunc<() -> Int32>
    // case 2.1: indirect call a foreign func
    f = cfoo_1
    f()

    // case 2.2: indirect call a cangjie @C func
    f = cjfoo_1
    f()

    // case 2.3: indirect call a foreign func in a foreign func
    run_callback(cfoo_1)
    f = cfoo_1
    run_callback(f)

    // case 2.4: indirect call a cangjie @C func in a foreign func
    run_callback(cjfoo_1)
    f = cjfoo_1
    run_callback(f)

    /************ 3. cfunc with annotation ************/
    // case 3.1: direct call a foreign func with @FastNative
    cfoo_2()

    // case 3.2: indirect call a foreign func with @FastNative
    f = cfoo_2
    f()

    // case 3.3: direct call a cangjie @C func with @FastNative
    cjfoo_2()

    // case 3.4: indirect call a cangjie @C func with @FastNative
    f = cjfoo_2
    f()
}
