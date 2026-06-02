/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a11_01

  @Level:         1
  @Assertion:   A.2.5(11)
    tryExpression
        : TRY NL* block NL* FINALLY NL* block
        | TRY NL* block (NL* CATCH NL* LPAREN NL* catchPattern NL* RPAREN NL* block)+ (NL* FINALLY NL* block)?
        | TRY NL* LPAREN NL* resourceSpecifications NL* RPAREN NL* block
        (NL* CATCH NL* LPAREN NL* catchPattern NL* RPAREN NL* block)* (NL* FINALLY NL* block)?
        ;
    catchPattern
        : wildcardPattern
        | exceptionTypePattern
        ;
    exceptionTypePattern
        : (WILDCARD | identifier) NL* COLON NL* type (NL* BITOR NL* type)*
        ;

    resourceSpecifications
        : resourceSpecification (NL* COMMA NL* resourceSpecification)*
        ;
    resourceSpecification
        : identifier (NL* COLON NL* classType)? NL* ASSIGN NL* expression
        ;

  @Description: Check trivial try-catch-finally expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

var global = 0

class GlobalVarResource <: Resource {
    init() {
        global = 1
    }

    public func isClosed() {
        false
    }

    public func close() {
        global = 2
    }
}

main() {
    try {
        try {
            throw ArithmeticException("Ooops")
        } finally { }
    } catch(e: ArithmeticException) {
    } catch (_) { } finally { }

    try {
        try (gv = GlobalVarResource()) {
            throw NoneValueException("Ooops again")
        } finally { }
    } catch(e: NoneValueException) {
    } catch (_) { } finally { }

    return 0
}
