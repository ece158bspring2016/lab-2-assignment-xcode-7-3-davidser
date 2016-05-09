import UIKit

struct Player {
    var name: String?
    var team: String?
    var rating: Int
    
    init(name: String?, team: String?, rating: Int) {
        self.name = name
        self.team = team
        self.rating = rating
    }
}