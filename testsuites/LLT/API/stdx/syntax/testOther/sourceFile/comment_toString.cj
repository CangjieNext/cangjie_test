/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// aaa //bbb
// c

/* ddd */
/*eee*/

/**
ffffff
*/ // ff
// ggg

main() {}

// line comment1
func foo<T>(/** document comment1 */ a: T, /** document comment2 */ b!: Int64 = 0) /* block comment1 */ where T <: I1 /** document comment3 */ & I2 /* block comment2*/ {
    func goo(a0: Int64) : (Int64 /* block comment3 */, /* block comment4 */ Int64) { (a0, a0)}
    // line comment2

    return (0, a)
} // line comment3

@M1/* block comment1 */ [/* block comment2 */expr] /* block comment3 */var a = 1 // line comment1

func a() {
    return match (litKind) {
        case TokenKind.BOOL_LITERAL => FieldType()
        case TokenKind.RUNE_LITERAL => FieldType()
        case _ => ()
        // TODO
    }
}

func b() {
    {
        =>
        @synmmetry[] func spawnCoroutine() {
            // 等待
            crdRegistrationMgr.waitForInitialSync()
            autoApiServiceRegistrationController.run()
        }
        spawn {spawnCoroutine()}
    }()

    match {
        case 1 =>
        // comment on 1
        1
        // comment on ()
        () // comment on matchCase
        case _ => 1
    }

    match (this) {
        case RSA => ()
        case RSA_X931
            /*
             * comment on matchCase
             */
            => 1
        case _ => 1
    }

    match (a) {
        case _ => () // hello
    }

    match {
        case _ => () // hello
    }

    match {
        case /* comment */ 1 => 1
        case _ => 1
    }
}

enum E1
{
    | B1 /* block comment1 */ (/* block comment2 */T/* block comment3 */, /* block comment4 */R/* block comment5 */) // comment
}

enum E {
    // comment
    | Enum
    | A
    | B
}