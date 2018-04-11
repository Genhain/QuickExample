import Foundation
import Quick

extension QuickSpec: GivenWhenThenable {
    
    typealias BDDClosure = (description: String, file: String, line: UInt, closure: () -> Void)
    
    private enum AssociatedKeys {
        static var setupClosures = "QuickSpec.setupClosures"
    }
    
    var setupClosures: [BDDClosure]? {
        get {
            guard let setupClosures = objc_getAssociatedObject(self, &AssociatedKeys.setupClosures) as? [BDDClosure] else {
                return []
            }
            return setupClosures
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self,
                                         &AssociatedKeys.setupClosures,
                                         newValue as [BDDClosure]?,
                                         .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    func feature(_ description: String, closure: () -> Void) {
        describe(description, closure: closure)
    }
    
    func scenario(_ description: String, closure: () -> Void) {
        context(description, closure: closure)
    }
    
    func given(_ description: String, file: String = #file, line: UInt = #line, closure: @escaping () -> Void) {
        setupClosures?.append((description, file, line, closure))
    }
    
    func and(_ description: String, file: String = #file, line: UInt = #line, closure: @escaping () -> Void) {
        setupClosures?.append((description, file, line, closure))
    }
    
    func but(_ description: String, file: String = #file, line: UInt = #line, closure: @escaping () -> Void) {
        setupClosures?.append((description, file, line, closure))
    }
    
    func when(_ description: String, file: String = #file, line: UInt = #line, closure: @escaping () -> Void) {
        setupClosures?.append((description, file, line, closure))
    }
    
    func then(_ description: String, file: String = #file, line: UInt = #line, closure: @escaping () -> Void) {
        
        var testDescription: String = ""
        
        if let descriptions = (setupClosures?.map { $0.description }) {
            testDescription = descriptions.joined(separator: " ")
        }
        
        testDescription += " " + description
        
        it(testDescription, flags: [:], file: file, line: line) {
            self.setupClosures?.forEach { $0.closure() }
            closure()
            self.setupClosures = nil
        }
    }
}

