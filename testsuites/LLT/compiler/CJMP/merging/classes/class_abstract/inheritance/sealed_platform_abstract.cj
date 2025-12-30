// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common abstract class A {
    public common var x = 10
    public init() {}
}
public class B <: A {
    public init() {}
}

// SEPARATE-FILE: p.cj
// EXEC-0: %compiler %noColor --experimental p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// EXEC-PIPE: %run %output

package cmp

public platform sealed abstract class A {
    public platform var x = 20
}


public class C <: A {
    public init() {}
}
main(){
    B().x-C().x
}
