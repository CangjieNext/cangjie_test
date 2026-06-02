/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output 2>&1 | compare %f


import define.*

@SAME @SAME[123]
class A<T>{
    static let counter: Int64 = 3
    let name: String = "afdoaidfad"
    @SAME @SAME[123]
    private A(
    name: String, // regular parameter
    annotation!: String = "nnn", // regular parameter
    var width!: Int64 = 1, // member variable parameter with initial value
    private var length!: Int64, // member variable parameter
    private var height!: Int64 = 3 // member variable parameter
    ){
    @SAME @SAME[123]
    var temp = 1
    @SAME @SAME[123]
    {}
    @SAME @SAME[123]
    func test(){}
    }
    @SAME @SAME[123]
    init(i : T){
    @SAME @SAME[123]
    var temp = i;
    @SAME @SAME[123]
    {}
    @SAME @SAME[123]
    func test(){}
    width = 1
    length = 2
    height = 3

    }
}

@SAME @SAME[123]
struct B<T>{
    static let counter: Int64 = 3
    let name: String = "afdoaidfad"
    @SAME @SAME[123]
    private B(
    name: String, // regular parameter
    annotation!: String = "nnn", // regular parameter
    var width!: Int64 = 1, // member variable parameter with initial value
    private var length!: Int64, // member variable parameter
    private var height!: Int64 = 3 // member variable parameter
    ){
    @SAME @SAME[123]
    var temp = 1
    @SAME @SAME[123]
    {}
    @SAME @SAME[123]
    func test(){}
    }
    @SAME @SAME[123]
    init(i : T){
    @SAME @SAME[123]
    var temp = i;
    @SAME @SAME[123]
    {}
    @SAME @SAME[123]
    func test(){}
    width = 1
    length = 2
    height = 3

    }
}

main(){
    A<Int64>(1).width - 1 + B<Int64>(1).width - 1
}
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_expected_double_arrow_in_lambda
