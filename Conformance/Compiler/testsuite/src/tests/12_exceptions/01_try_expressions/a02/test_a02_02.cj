/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_a02_02

  @Level:         1

  @Assertion:    12.1(2) The syntax of try expressions is as follows.
                         tryExpression
                         : 'try' block 'finally' block
                         | 'try' block ('catch' '(' catchPattern ')' block)+ ('finally' block)?
                         | 'try' '(' ResourceSpecifications ')' block ('catch' '(' catchPattern ')'
                            block)* ('finally' block)?
                         ;
                         catchPattern
                         : wildcardPattern
                         | exceptionTypePattern
                         ;
                         exceptionTypePattern
                         : ('_' | identifier) ':' type ('|' type)'*'
                         ;
                         ResourceSpecifications
                         : ResourceSpecification (',' ResourceSpecification)'*'
                         ;
                         ResourceSpecification
                         : identifier (':' classType)? '=' expression


  @Description:  Checks all possible variants of try-with-resource expression.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

class Res <: Resource {
    public func isClosed() : Bool {
        return true
    }
    public func close() : Unit {}
}

main() {
// test case #1
    try (r = Res()) {}
// test case #2
    try (r = Res()) {
    } catch (_) {}
// test case #3
    try (r = Res()) {
    } catch (_) {
    } finally {}
// test case #4
    try (r = Res()) {
    } catch (e: ArithmeticException) {
    } catch (_) {
    } finally {}
// test case #5
    try (r = Res()) {
    } catch (e: ArithmeticException | IndexOutOfBoundsException) {
    } catch (_ : StackOverflowError) {}
// test case #6
    try (r = Res()) {
    } catch (e: ArithmeticException | IndexOutOfBoundsException) {
    } catch (_ : StackOverflowError) {
    } finally {}
// test case #7
    try (r = Res()) {
    } catch (e: ArithmeticException | IndexOutOfBoundsException) {
    } finally {}
// test case #8
    try (r : Res = Res()) {}
// test case #9
    try (r1 = Res(), r2 = Res()) {}
// test case #10
    try (r1 = Res(), r2 = Res()) {
    } catch (_) {}
// test case #11
    try (r1 = Res(), r2 = Res()) {
    } catch (_) {
    } finally {}
// test case #12
    try (r1 = Res(), r2 = Res()) {
    } catch (e: ArithmeticException) {
    } catch (_) {
    } finally {}
}
