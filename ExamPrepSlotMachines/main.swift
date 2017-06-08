import Foundation

/*
 
 ORGANIZING YOUR SOLUTION
 
 A good way to orgaize your code is to separate your code into the three sections - input, process, output – as much as possible.
 
 The start of a solution is implemented below. Consider all the possible inputs. Can you finish the solution?
 
 */

/*
 
 INPUT
 
 Be sure that your implementation of this section discards all the possible bad inputs the user could provide.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */
var inputs = [Int]()
var prompts : [String] = [
    "How many quarters does Martha have in the jar?",
    "How many times has the first machine been played since paying out?",
    "How many times has the second machine been played since paying out?",
    "How many times has the third machine been played since paying out?"
]

struct bound {
    var upper : Int
    var lower : Int
}

var bounds = [bound]()
bounds.append(bound(upper: 1000, lower: 1))
bounds.append(bound(upper: 35, lower: 0))
bounds.append(bound(upper: 100, lower: 0))
bounds.append(bound(upper: 10, lower: 0))

// Loop until valid input is received
while inputs.count < 4 {
    
    // Show the prompt
    print(prompts[inputs.count])
    
    // Get the user's input
    var input : String?
    input = readLine()
    
    // Use optional binding to see if the string can be unwrapped (to see if it is not nil)
    if let notNilInput = input {
        if let inputAsInt = Int(notNilInput) {
            if inputAsInt < bounds[inputs.count].upper && inputAsInt >= bounds[inputs.count].lower {
                inputs.append(inputAsInt)
            }
        }
    }
    
}

/*
 
 PROCESS
 
 Here is where you implement the logic that solves the problem at hand.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */

// Add 'process' code below....
var quarterNum = inputs[0]
var totalPlays = 0

while quarterNum > 0 {
//    totalPlays += 3
//    for i in 1 ... inputs.count - 1 {
//        inputs[i] += 1
//        quarterNum -= 1
//    }
    
    if quarterNum > 0 {
        inputs[1] += 1
        quarterNum -= 1
        totalPlays += 1
        if (inputs[1] == 35) {
            inputs[1] = 0
            quarterNum += 30
        }
    }
    
    if quarterNum > 0 {
        inputs[2] += 1
        quarterNum -= 1
        totalPlays += 1
        if (inputs[2] == 100) {
            inputs[2] = 0
            quarterNum += 60
        }
    }
    
    if quarterNum > 0 {
        inputs[3] += 1
        quarterNum -= 1
        totalPlays += 1
        if (inputs[3] == 10) {
            inputs[3] = 0
            quarterNum += 9
        }
    }
}


/*
 
 OUTPUT
 
 Here is where you report the results of the 'process' section above.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */

// Add 'output' code below... replace what is here as needed.
print("Martha plays \(totalPlays) times before going broke.")
