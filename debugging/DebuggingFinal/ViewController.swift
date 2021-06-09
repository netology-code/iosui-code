//
//  ViewController.swift
//  DebuggingFinal
//
//  Created by Artem Novichkov on 09.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    var button: UIButton?

    var books = ["HarryPotter", "Alchemist", "Angels and demons"]

    var closure: (() -> Void)?

    var palette: Palette? {
        didSet {
            button?.backgroundColor = palette?.color
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        button = UIButton(type: .system)
        view.addSubview(button!)
        button!.frame = CGRect(x: 20, y: 200, width: 200, height: 50)

        configureBooks()
//        configureUsers()
        configureCycle()

        palette = Palette.red

        let dog = Dog()
        let cat = Cat()

        print(dog, cat)
    }

    private func configureBooks() {
//        assert(books.count == 0, "Books mustn't be empty")
//        precondition(books.count == 0, "Books mustn't be empty")

//        if button == nil {
//            fatalError("Button is nil")
//        }

        for book in books {
            print(book)
        }

        closure = {
            let alex = User(name: "alex", age: 33)
            print(alex)
        }

        closure?()
    }

    private func configureUsers() {
        let user1 = User(name: "Bob", age: 25)
        let user2 = User(name: "Alex", age: 22)

        print(user1)
        print(user2)

        debugPrint(user1)
    }

    private func configureCycle() {
        var i = 0

        while i < 5 {
            print("oldValue \(i)")
            i += 1
        }
    }
}

class User: CustomStringConvertible {
    var name: String
    var age: Int

    var description: String {
        return "\(type(of: self)) - \(name) - \(age)"
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension User: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Debug \(type(of: self)) - \(name) - \(age)"
    }
}

struct AppColor { }

extension AppColor {
    static let white = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)
}

enum Palette {
    case white
    case black
    case red

    var color: UIColor {
        switch self {
        case .white:
            return UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)
        case .black:
            return UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        case .red:
            return UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 1)
        }
    }
}

enum Image {
    case addButton
    case placeholder
}


class Dog {

}

class Cat: NSObject {

}

