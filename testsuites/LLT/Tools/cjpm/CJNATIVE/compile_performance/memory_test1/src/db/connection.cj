package demo.db
import demo.config.*

public class Database {
    public func connect(): Unit {
        if (AppConfig.DEBUG_MODE) {
            println("[DB] Connecting to Dev Database...")
        }
    }
}