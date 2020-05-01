import Cocoa

struct Student
{
    var name: String
    var number: Int
}

class School
{
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String)
    {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...)
    {
        for name in names
        {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student?
    {
        get
        {
            if index < self.number
            {
                return self.students[index]
            }
            return nil
        }
        set
        {
            guard var newStudent: Student = newValue else
            {
                return
            }
            var number: Int = index
            
            if index > self.number
            {
                number = self.number
                self.number + 1
            }
            
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String) -> Int?
    {
        get
        {
            return self.students.filter{ $0.name == name }.first?.number
        }
        set
        {
            guard var number: Int = newValue else
            {
                return
            }
            
            if number > self.number
            {
                number = self.number
                self.number += 1
            }
            
            let newStudent: Student = Student(name: name, number: number)
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String, number: Int) -> Student?
    {
        return self.students.filter{ $0.name == name && $0.number == number }.first
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "MinJeong", "JuHyun", "JiYoung", "SeongUK", "MoonDuk")

let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")

print(highSchool["MinJeong"])
print(highSchool["MinHee"])

highSchool[0] = Student(name: "HongEui", number: 0)
print(highSchool[0])

//타입 서브스크립트 구현
enum School2: Int
{
    case elementary = 1
    case middle
    case high
    case university
    
    static subscript(level: Int) -> School2?
    {
        return Self(rawValue: level)    //return School(rawValue: level)과 같은 표현
    }
}

let school: School2? = School2[2]
print(school)
