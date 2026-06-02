/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a22_03

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


  @Description:  Checks that the type pattern cannot refer to the member function for ChildTwo class.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

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
        e.whatChildTwo()
    } 
}
