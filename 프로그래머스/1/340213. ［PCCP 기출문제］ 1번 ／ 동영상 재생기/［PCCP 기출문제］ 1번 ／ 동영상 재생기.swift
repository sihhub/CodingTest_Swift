import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    
    func timeToSeconds(_ time: String) -> Int {
        let parts = time.split(separator: ":").compactMap { Int($0) }

        guard parts.count == 2 else {
          print("Invalid time format: \(time)")
          return 0
        }
        
        return parts[0] * 60 + parts[1]
    }
    
    func secondsToTime(_ seconds: Int) -> String {
        let minutes = seconds / 60 
        let remain = seconds % 60 
        return String(format: "%02d:%02d", minutes, remain)
    }
    
    let videoLength = timeToSeconds(video_len)
    let opStart = timeToSeconds(op_start)
    let opEnd = timeToSeconds(op_end)
    var currentPos = timeToSeconds(pos)
    
    for command in commands {
        if opStart <= currentPos && currentPos <= opEnd {
            currentPos = opEnd 
        }
        
        if command == "prev" {
            currentPos = max(0, currentPos - 10)
        } else if command == "next" {
            currentPos = min(videoLength, currentPos + 10)
        }
        if opStart <= currentPos && currentPos <= opEnd {
            currentPos = opEnd 
        }
    }
    
    
    
    return secondsToTime(currentPos)
}