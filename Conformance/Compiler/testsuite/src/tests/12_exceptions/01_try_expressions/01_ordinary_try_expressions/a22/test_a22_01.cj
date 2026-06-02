/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a22_01

  @Level:         1

  @Assertion:    12.1.1(22) An example of the usage of the type pattern is shown below:
      // The first situation. 
      main() { 
           try { 
               throw ArithmeticException() 
           } catch (e: RuntimeException) { // Caught. 
               print("RuntimeException and its subtypes can be caught here") 
           } 
      } 

      // User defined exceptions. 
      open class Father <: Exception { 
          var father: Int64 = 0 
           func whatFather() { 
               print("I am Father") 
           } 
      } 
      class ChildOne <: Father { 
          var childOne: Int64 = 1 
           func whatChildOne() { 
               print("I am ChildOne") 
           } 
           func whatChild() { 
               print("I am method in ChildOne") 
           } 
      } 
      class ChildTwo <: Father { 
          var childTwo: Int64 = 2 
           func whatChildTwo() { 
               print("I am ChildTwo") 
           } 
           func whatChild() { 
               print("I am method in ChildTwo") 
           } 
      } 

      // Function main. 
      main() { 
          var a = 1 
           try { 
               throwE() 
           } catch (e: ChildOne | ChildTwo) { 
               e.whatFather() // ok: e is an object of Father 
                e.whatChildOne() // error: e is an object of Father 
                e.whatChild() // error: e is an object of Father 
                print(e.father) // ok: e is an object of Father 
                print(e.childOne) // error: e is an object of Father 
                print(e.childOTwo) // error: e is an object of Father 
            } 
            func throwE() { 
                 if (a == 1) { 
                     ChildOne() 
                 } else { 
                     ChildTwo() 
                 } 
            } 
       } 

    The following shows an example of a finally block. 

    // Catch with exceptionTypePattern. 
    let arrayTest: Array<Int64> = [0, 1, 2]
    try { 
         let lastElement = arrayTest[3] 
    } catch (e: ArithmeticException | ArrayIndexOutOfBoundsException) { 
         print("exception info: " + e.toString()) 
    } catch (e: Exception) { 
         print("neither ArithmeticException nor ArrayIndexOutOfBoundsException, exception info: " + e.toString()) 
    } finally { 
         print("the finally block is executed") 
    } 


  @Description:  Checks how the type pattern works.

  @Mode:         run

  @Negative:     no

  @Issue:        0006271

  @Structure:    single

*/

import utils.assert.Assert

open class Father <: Exception { 
    var father: Int64 = 0 
    func whatFather() { 
        print("I am Father") 
    } 
} 
class ChildOne <: Father { 
    var childOne: Int64 = 1 
    func whatChildOne() { 
        print("I am ChildOne") 
    } 
    func whatChild() { 
        print("I am method in ChildOne") 
    } 
} 
class ChildTwo <: Father { 
    var childTwo: Int64 = 2 
    func whatChildTwo() { 
        print("I am ChildTwo") 
    } 
    func whatChild() { 
        print("I am method in ChildTwo") 
    } 
} 

main() {
// test case #1
    var exception_caught : Bool = false
    let arr: Array<Int32> = [-1, -2, -3]
    try { 
        for (ind in [0, 1, 2, 3]) {
            arr[ind]
        }
    } catch (e: ArithmeticException | IndexOutOfBoundsException) {       
        exception_caught = true
    } catch (e: Exception) { 
        Assert.fail(reason : "Unexpected execution.")
    } finally { 
        Assert.equals(true, exception_caught) 
    }

 
// test case #2
    var catch_block : Bool = false 
    try { 
        throw ArithmeticException() 
    } catch (e: Exception) { // Caught. 
        print("RuntimeException and its subtypes can be caught here\n")
        catch_block = true
    }
    Assert.equals(true, catch_block) 

// test case #3
    var a = 1 
    func throwE() { 
         if (a == 1) { 
             ChildOne() 
         } else { 
             ChildTwo() 
         } 
    }
    try { 
        throwE() 
    } catch (e: ChildOne | ChildTwo) {
        e.whatFather() // ok: e is an object of Father
        Assert.equals(0, e.father) // ok: e is an object of Father 
        print(e.father)
    } 

// test case #4
    var cnt : Int32 = 0
    var index = 0
    let arrayTest: Array<Int64> = [0, 1, 2]
    for (ind in [0, 1, 2]) {
        index++
    }

    try { 
         let lastElement = arrayTest[index]
    } catch (e: ArithmeticException | IndexOutOfBoundsException) { 
         print("exception info: " + e.toString())
         cnt++
    } catch (e: Exception) { 
         print("neither ArithmeticException nor ArrayIndexOutOfBoundsException, exception info: " + e.toString())
         Assert.fail()
    } finally { 
         print("the finally block is executed\n")
         cnt++
    }
    Assert.equals(2, cnt)

}
