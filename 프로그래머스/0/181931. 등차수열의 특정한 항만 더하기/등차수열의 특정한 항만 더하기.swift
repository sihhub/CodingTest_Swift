import Foundation

func solution(_ a:Int, _ d:Int, _ included:[Bool]) -> Int {
    
    var result = 0
    
    for (index, bool) in included.enumerated() {
        if bool {
            result += a + (index * d)
        }
    }
    
    
    return result 
}