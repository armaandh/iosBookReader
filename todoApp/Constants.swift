import Foundation

var bookListHaveRead:[Info]?

var bookListWillRead:[Info]?

struct PrePreItem: Decodable {
    let title: String?
    let subtitle: String?
    let publishedDate: String?
    let description: String?
}

struct PreItem: Decodable {
    let volumeInfo: PrePreItem?
}

struct Item: Decodable {
    let items: [PreItem]?
}

struct Info {
    var image: String?
    var title: String?
    var availability: Bool?
    var description: String?
    var rating: Int?
    
    init(image: String, title: String, availability: Bool, description: String, rating: Int) {
        self.image   = image
        self.title = title
        self.availability = availability
        self.description = description
        self.rating = rating
    }
}

func saveDataHaveRead(bookListHaveRead:[Info]) {
    UserDefaults.standard.set(bookListHaveRead, forKey: "bookListHaveRead")
}

func saveDataWillRead(bookListWillRead:[Info]) {
    UserDefaults.standard.set(bookListWillRead, forKey: "bookListWillRead")
}

func fetchDataHaveRead() -> [Info]? {
    if let book = UserDefaults.standard.array(forKey: "bookListHaveRead") as? [Info] {
        return book
    }
    else {
        return nil
    }
}

func fetchDataWillRead() -> [Info]? {
    if let book = UserDefaults.standard.array(forKey: "bookListWillRead") as? [Info] {
        return book
    }
    else {
        return nil
    }
}

