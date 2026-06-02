// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import define.*
 
@Annotation
public class A {
    public const init(arg1:String, arg2:String) {}
}
 
@Annotation
public class B {
    public const init() {}
}
 
@A["arg1", "arg2"]
class C {
    @B
    func test(){}
}
 
main(){}