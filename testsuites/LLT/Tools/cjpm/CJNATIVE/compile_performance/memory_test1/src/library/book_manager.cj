package demo.library
import demo.user.*

public class LibrarySystem {
    public func borrowBook(student: Student, bookName: String): Unit {
        println("[Library] ${student.name} 借阅了《${bookName}》")
    }
}