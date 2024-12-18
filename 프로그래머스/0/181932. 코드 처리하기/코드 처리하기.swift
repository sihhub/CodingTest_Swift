import Foundation

func solution(_ code:String) -> String {
    var mode = 0
    var ret = ""
    let codeArray = Array(code)
    
    for (idx, char) in codeArray.enumerated() {
        if char == "1" {
            mode = 1 - mode 
        } else {
            if mode == 0 && idx % 2 == 0 {
                ret.append(char)
            } else if mode == 1 && idx % 2 != 0 {
                ret.append(char)
            }
        }
    }
    
    return ret.isEmpty ? "EMPTY" : ret
}