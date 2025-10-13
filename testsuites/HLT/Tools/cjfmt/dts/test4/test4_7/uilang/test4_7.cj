/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Foo {
    private var a = 0
    @Frozen public mut prop b: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value}}
}
open public class TestClass {
    public var a: Int64 = 0
}
extend TestClass {    @Frozen public mut prop prop6: Int64 {
        get() {
            6}
        set(v) {
            a = v   } }

}

public interface I1 {@Frozen prop in_prop_v5: Int64 {
    get() {
            5
        }}
}

main() {}