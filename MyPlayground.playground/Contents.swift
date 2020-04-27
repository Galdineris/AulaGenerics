import Foundation

var intA = 1
var intB = 2
let maiorInt = maior(intA, intB)

var doubleA = Double.pi
var doubleB = 3.14
let maiorDouble =  maior(doubleA, doubleB)

var tratorA = AgriculturalMachinery(size: 12)
var tratorB = AgriculturalMachinery(size: 783)
let maiorTrator = maior(tratorA, tratorB)

var pilha = Pilha<Int>()

pilha.push(intA)
pilha.push(intB)

//MARK: Fazer um método que recebe um Array e um elemento, retorna um Bool dizendo se o elemento se encontra no Array
func isThis<T: Equatable>(object element: T, in array: [T]) -> Bool {
    for index in array {
        if index == element{
            return true
        }
    }
    return false
}
isThis(object: "Batata", in: ["Cebola", "Alface", "Mamão"])

let numbers = [17, 22, 144]
isThis(object: 42, in: numbers)

//MARK: Extensão de Array contendo uma função que retorna a soma de todos os elementos, independente de qual o valor numérico
extension Array where Element: AdditiveArithmetic {
    func sumAllNumbers() -> Element{
        return self.reduce(Element.zero){$0 + $1}
    }
}
numbers.sumAllNumbers()

//MARK: Fazer um método que recebe 2 Arrays e retorna um Int referente a quantidade de elementos presentes em ambos os Arrays
func howManyInCommon<T: Equatable>(in arrayA: [T], and arrayB: [T]) -> Int {
    var total = Int.zero
    let longer = arrayA.count >= arrayB.count ? arrayA : arrayB
    let shorter = arrayA.count >= arrayB.count ? arrayB : arrayA
    for item in longer{
        if isThis(object: item, in: shorter) {
            total += 1
        }
    }
    return total
}

let reversedNumbers = [71, 22, 441]
howManyInCommon(in: numbers, and: reversedNumbers)

    //TODO: Fazer o método acima receber N arrays
//func howManyInCommon<T: Equatable>(in arrays:[T]...) -> Int {
//    var total = Int.zero
//    var aux = arrays
//    for _ in 0..<arrays.count{
//        if let pivot = aux.popLast() {
//            print(pivot)
//            for array in aux{
//                total += howManyInCommon(in: pivot, and: array)
//            }
//            aux.insert(pivot, at: 0)
//        }
//    }
//    return total
//}
//
//var numbersGalore = [numbers, reversedNumbers]
//for _ in 0..<6 {
//    numbersGalore.append({
//            return (0..<6).map { _ -> Int in .random(in: 20...30) }
//    }())
//}
//howManyInCommon(in: numbersGalore)
