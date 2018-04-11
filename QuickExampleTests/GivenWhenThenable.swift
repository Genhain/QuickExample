import Foundation

protocol GivenWhenThenable {
    func feature(_ description: String, closure: () -> Void)
    func scenario(_ description: String, closure: () -> Void)
    func given(_ description: String, file: String, line: UInt, closure: @escaping () -> Void)
    func and(_ description: String, file: String, line: UInt, closure: @escaping () -> Void)
    func but(_ description: String, file: String, line: UInt, closure: @escaping () -> Void)
    func when(_ description: String, file: String, line: UInt, closure: @escaping () -> Void)
    func then(_ description: String, file: String, line: UInt, closure: @escaping () -> Void)
}
