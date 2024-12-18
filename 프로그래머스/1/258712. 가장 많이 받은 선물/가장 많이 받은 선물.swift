import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    // 두 사람 간 선물 기록을 저장할 딕셔너리
    var giftCounts = [String: [String: Int]]()
    
    // 초기화
    for friend in friends {
        giftCounts[friend] = [:]
        for other in friends where friend != other {
            giftCounts[friend]?[other] = 0
        }
    }
    
    for gift in gifts {
        let parts = gift.split(separator: " ")
        let giver = String(parts[0])
        let receiver = String(parts[1])
        giftCounts[giver]?[receiver, default: 0] += 1
    }
    
    
    var giftIndex = [String:Int]()
    
    for friend in friends {
        let given = giftCounts[friend]?.values.reduce(0, +) ?? 0
        let received = giftCounts.values.map { $0[friend] ?? 0 }.reduce(0, +)
        
        giftIndex[friend] = given - received 
    }
    
    
    var nextMonthReceived = [String: Int](uniqueKeysWithValues: friends.map{ ($0, 0) })
    
    
    for giver in friends {
        for receiver in friends where giver != receiver {
            let given = giftCounts[giver]?[receiver] ?? 0
            let received = giftCounts[receiver]?[giver] ?? 0
            
            if given > received {
                nextMonthReceived[giver, default: 0] += 1
            } else if  given == received {
                if giftIndex[giver]! > giftIndex[receiver]! {
                    nextMonthReceived[giver,  default: 0] += 1
                }
            }
        }
    }
   
    
    return nextMonthReceived.values.max() ?? 0
}