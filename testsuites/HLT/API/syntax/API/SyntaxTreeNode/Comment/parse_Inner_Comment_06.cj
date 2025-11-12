/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: Inner_Comment_06.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_Inner_Comment_06() {
    let res = parseFile("./Inner_Comment_06.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    sourcefile.toString() |> println
    @Assert(sourcefile.toString(), ##"/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// line comment1
extend<T> A<T> /* block comment1 */ where T <: I1 {
    public func foo() {}
    // line comment2
    public mut prop _prop: Int64 {
        /* block comment2 */
        get( /** document comment1 */ ) { 0  /** document comment2 */}

        set(/* block comment3 */ v) {
            // line comment3
        }
    }
    
} // line comment4"##)

    var _decl: ClassDecl = (sourcefile.topLevelDecls[0] as ClassDecl).getOrThrow()
    @Assert(_decl.toString(), ##"// line comment1
extend<T> A<T> /* block comment1 */ where T <: I1 {
    public func foo() {}
    // line comment2
    public mut prop _prop: Int64 {
        /* block comment2 */
        get( /** document comment1 */ ) { 0  /** document comment2 */}

        set(/* block comment3 */ v) {
            // line comment3
        }
    }
    
} // line comment4"##)

}
