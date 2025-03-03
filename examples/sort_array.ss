//
// sort_array.ss
// Sorting arrays in SurgeScript
// Copyright 2017 Alexandre Martins <alemartf(at)gmail(dot)com>
//

object "Application"
{
    arr = [3, 7, 1, 5, 9, 2, 4, 6, 8, 0];
    
    state "main"
    {
        Console.print("Original array:");
        printNumbers();

        Console.print("Sorting in ascending order...");
        arr.sort(null);
        printNumbers();

        Console.print("Sorting in descending order...");
        arr.reverse();
        printNumbers();

        Console.print("Sorting in custom order (odds first)...");
        arr.sort(spawn("SortStrategy.OddsFirst"));
        printNumbers();

        Application.exit();
    }

    fun printNumbers()
    {
        str = "";
        for(i = 0; i < arr.length; i++)
            str += arr[i] + " ";
        Console.print(str);
    }
}

// A custom sorting strategy that puts odd numbers first
object "SortStrategy.OddsFirst"
{
    //
    // The call() method compares two numbers.
    //
    // call(a, b) will return:
    //   -1 if a should come BEFORE b
    //    1 if a should come AFTER b
    //    0 if a and b share the same relative order
    //
    fun call(a, b)
    {
        aIsOdd = (Math.mod(a, 2) != 0);
        bIsOdd = (Math.mod(b, 2) != 0);

        if(aIsOdd && !bIsOdd)
            return -1;
        else if(!aIsOdd && bIsOdd)
            return 1;
        else if(a < b)
            return -1;
        else if(a > b)
            return 1;
        else
            return 0;
    }
}
