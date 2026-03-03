package demo.finance
import demo.user.*

public class CampusCard {
    public func charge(student: Student, amount: Float64): Unit {
        println("[Finance] ${student.name} 充值了 ${amount} 元")
    }
}