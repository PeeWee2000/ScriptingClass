// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.

open System

[<EntryPoint>]
let main argv = 
    
    let mutable ExitCondition = 0

    while ExitCondition = 0 do

        Console.Clear()

        let Options = [
            "1: Multiply"
            "2: Divide"
            "3: Add"
            "4: Subtract"
            "Q: Quit"
        ]

        for option in Options do
            printfn "%s" option


        let mutable SelectedOption = null

        while SelectedOption = null do
            if Console.KeyAvailable = true then
                SelectedOption <- Console.ReadKey().KeyChar.ToString()
    
        Console.Clear()

        printf "Please enter the first value for the operation: "
        let Option1 = Console.ReadLine()
        printf "Please enter the second value for the operation: "
        let Option2 = Console.ReadLine()

        let tryToInt s = 
            match System.Double.TryParse s with
            | true, v ->  v
            | false, _ -> 0.0

        let int1 = tryToInt(Option1)
        let int2 = tryToInt(Option2)

        let mutable Answer = 0.0

        if SelectedOption = "1" then
            Answer <- int1 * int2
        elif SelectedOption = "2" then
            if int2 = 0.0 then
                printf "Cannot divide by zero"
            else
                Answer <- int1 / int2
        elif SelectedOption = "3" then
            Answer <- int1 + int2
        elif  SelectedOption = "4" then
            Answer <- int1 - int2
        elif SelectedOption = "Q" then
            ExitCondition <- 1

        if ExitCondition = 0 then
            printf "The result of that operation is: %A" Answer
            printf "\nPress any key to continue"
            ignore(Console.ReadKey())



    0 // return an integer exit code
