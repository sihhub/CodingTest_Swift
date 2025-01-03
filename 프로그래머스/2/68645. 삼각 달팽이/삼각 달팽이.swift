import Foundation

func solution(_ n:Int) -> [Int] {
    
    var triangle = Array(repeating: Array(repeating: 0, count: n), count:n)
    var value = 1 

    var x = -1, y = 0
    
    for size in stride(from: n, to: 0, by: -3) {
        for _ in 0..<max(size, 0) {
            x += 1
            triangle[x][y] = value
            value += 1
        }
        
        for _ in 0..<max(size-1, 0) {
            y += 1 
            triangle[x][y] = value
            value += 1
        }
        
        for _ in 0..<max(size-2, 0) {
            y -= 1
            x -= 1 
            triangle[x][y] = value 
            value += 1
        }
        
    }
    
    var result:[Int] = []
    
    
    for x in 0..<n {
        for y in 0...x{
            result.append(triangle[x][y])
        }
    }
    
        
    return result
}