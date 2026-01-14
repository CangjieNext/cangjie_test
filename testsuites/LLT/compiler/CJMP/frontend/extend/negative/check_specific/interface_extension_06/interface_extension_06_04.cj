// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: a/a.cj
// EXEC-0: %compiler %noColor a/a.cj --output-type=staticlib
package A

public class Foo<M,N> {}

public interface Ioo<O, P> {}


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj libA.a --output-type=chir --output-dir ./c
package cmp

import A.*

type aliasFooC<R,S> = Foo<R,S>;
type aliasIooC<U,V> = Ioo<U,V>;

common extend<T, G> aliasFooC<T, G> where T <: aliasIooC<G, G> {
    common func goo<Z>(z:Z, t:aliasIooC<T,T>):Unit {
        println("common::goo<Z>")
    }

    common public mut prop p: aliasFooC<T,T> {
        get() { p }
        set(t) { }
    }
}


// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

import A

specific extend<T, G> A.Foo<T, G> where T <: A.Ioo<G, G> {
    specific func goo<Z>(z:Z, t:A.Ioo<T,T>):Unit {
        println("specific::goo<Z>")
    }

    specific public mut prop p: A.Foo<T,T> {
        get() { p }
        set(t) { }
    }
}
