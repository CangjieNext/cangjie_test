package demo.security

public class AuthManager {
    public func login(username: String): Bool {
        println("[Security] User ${username} logged in.")
        return true
    }
}