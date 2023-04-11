
var battleGround = Array(repeating: Array(repeating: "*", count: 10), count: 10)
var RowHeading = ["A","B","C","D","E","F","G","H","I","J"]
//:  tug boat (3 on board), submarine (1 on board) or air craft carrier (1 on board).  

//numbers below is a count of exposed characters of each ship.
var tugBoat1charCount = 0;
var tugBoat2charCount = 0;
var tugBoat3charCount = 0;
var submarinecharCount = 0;
var airCraftcharCount = 0;

//visited locations will be stored here
var visitedLocations = [[Int]]() 

//we will hardCode the locations of the spaceships.
var tugBoat1 = [[0,0],[1,0]];
var tugBoat2 =  [[4,4],[4,5]];
var tugBoat3 =  [[4,8],[5,8]];
var submarine = [[6,2],[7,2],[8,2]];
var airCraft = [[9,4],[9,5],[9,6],[9,7]];

//check whether boat is already sunk or not
var isTugBoat1Sunk = false;
var isTugBoat2Sunk = false;
var isTugBoat3Sunk = false;
var isSubmarineSunk = false;
var isAirCraftSunk = false;

//================================================================
// battleGround[9][4] = "Ш"
// battleGround[9][5] = "Ш"
// battleGround[9][6] = "Ш"
// battleGround[9][7] = "Ш"

// battleGround[0][0] = "Ӝ"
// battleGround[1][0] = "Ӝ"

// battleGround[4][4] = "Ӝ"
// battleGround[4][5] = "Ӝ"

// battleGround[4][8] = "Ӝ"
// battleGround[5][8] = "Ӝ"

// battleGround[6][2] = "Ө"
// battleGround[7][2] = "Ө"
// battleGround[8][2] = "Ө"
//================================================================

func printGrid()
{
  print(">", terminator: "   ")
  
  
  var i = 1
  while (i <= 10) {
  print(i, terminator: "   ")
   i = i + 1
  }
  print("\n")

  
  for (index, item) in battleGround.enumerated() 
  {
    print(RowHeading[index], terminator: "   ")
    
    for  item2 in item
    {
      print(item2, terminator: "   ")
    }
    print("\n")
  }
}

//================================================================

func ask()
{
  print("Please enter Row :")
  let Row = readLine()!
  
  let RowNum = validate(Row: Row)

  if(RowNum != -1 )
  {
      print("Please enter Column :")
    var temp = readLine()!
      var Column = -1
      Column = Int(temp) ?? -1
      while ((Column < 1 || Column > 10) || ((type(of: Column)) != Int.self))
      {
          print("Invalid column number - use 1 to 10 :")
          
             temp = readLine()!
            Column = Int(temp) ?? -1
        
      }
            Column = Column - 1
            

    checkThatCell(Row: RowNum, Column: Column)

  }
  

  
}

//================================================================

func startGame()
{
  print("Welcome to Command Line Battleship")

  //reseting all the variables
  
  battleGround = Array(repeating: Array(repeating: "*", count: 10), count: 10)
  
   tugBoat1charCount = 0;
   tugBoat2charCount = 0;
   tugBoat3charCount = 0;
   submarinecharCount = 0;
   airCraftcharCount = 0;

   tugBoat1 = [[0,0],[1,0]];
   tugBoat2 =  [[4,4],[4,5]];
   tugBoat3 =  [[4,8],[5,8]];
   submarine = [[6,2],[7,2],[8,2]];
   airCraft = [[9,4],[9,5],[9,6],[9,7]];

   isTugBoat1Sunk = false;
   isTugBoat2Sunk = false;
   isTugBoat3Sunk = false;
   isSubmarineSunk = false;
   isAirCraftSunk = false;
  
  print("\n")
  printGrid()
  ask()
  
}
//================================================================

func validate(Row:String)->Int
{
    
    var RowNum = -1
    
    switch Row.uppercased() {
    case "A":
        RowNum = 0
    
    case "B":
        RowNum = 1
    
    case "C":
        RowNum = 2
      
    case "D":
        RowNum = 3
    
    case "E":
        RowNum = 4
    
    case "F":
        RowNum = 5

    case "G":
        RowNum = 6
      
    case "H":
        RowNum = 7
    
    case "I":
        RowNum = 8
    
    case "J":
        RowNum = 9
    
    default:
         print("Please enter a valid character for a row {between (A to J) or (a to j)}")
          ask()
      
    }
  return RowNum
}
//================================================================
func checkThatCell(Row:Int, Column:Int)
{

  if((tugBoat1.contains([Row,Column])) && (tugBoat1charCount < 2))
  {
    if(!visitedLocations.contains([Row,Column]))
    {
       visitedLocations.append([Row,Column])
       tugBoat1charCount+=1
       battleGround[Row][Column] = "Ӝ"
    }
    
   
  }
  else if((tugBoat2.contains([Row,Column])) && (tugBoat2charCount < 2))
  {
    if(!visitedLocations.contains([Row,Column]))
    {
      visitedLocations.append([Row,Column])
      tugBoat2charCount+=1
      battleGround[Row][Column] = "Ӝ"
    }
    
  }
  else if((tugBoat3.contains([Row,Column])) && (tugBoat3charCount < 2))
  {
    if(!visitedLocations.contains([Row,Column]))
    {
      visitedLocations.append([Row,Column])
      tugBoat3charCount+=1
      battleGround[Row][Column] = "Ӝ"
    }
    
  }
  else if((submarine.contains([Row,Column])) && (submarinecharCount < 3))
  {
    if(!visitedLocations.contains([Row,Column]))
    {
      visitedLocations.append([Row,Column])
      submarinecharCount+=1
      battleGround[Row][Column] = "Ө"
    }
    
  }
  else if((airCraft.contains([Row,Column])) && (airCraftcharCount < 4))
  {
    if(!visitedLocations.contains([Row,Column]))
    {
      visitedLocations.append([Row,Column])
      airCraftcharCount+=1
      battleGround[Row][Column] = "Ш"
    }
    
    
  }
  else
  {
    battleGround[Row][Column] = " "
  }

  sunkMessage()

 if((airCraftcharCount + submarinecharCount + tugBoat1charCount + tugBoat2charCount + tugBoat3charCount) == 13)
  {
    winner()
  }
  else
  {
    printGrid()
    ask()
  }
  
  
}
//================================================================

func sunkMessage()
{
  print("\n")
  if((tugBoat1charCount == 2) && (!isTugBoat1Sunk))
  {
    print("You sunk a tugBoat 1 !!!!")
    isTugBoat1Sunk = true
  }
  if((tugBoat2charCount == 2) && (!isTugBoat2Sunk))
  {
    print("You sunk a tugBoat 2 !!!!")
    isTugBoat2Sunk = true
  }
  if((tugBoat3charCount == 2) && (!isTugBoat3Sunk))
  {
    print("You sunk a tugBoat 3 !!!!")
    isTugBoat3Sunk = true
  }
  
  if((submarinecharCount == 3) && (!isSubmarineSunk))
  {
    print("You sunk a submarine!!!!")
    isSubmarineSunk = true
  }

  if((airCraftcharCount == 4) && (!isAirCraftSunk))
  {
    print("You sunk an air craft carrier!!!!")
    isAirCraftSunk = true
  }  
  print("\n")
}


//================================================================
func winner()
{
  print("Congratulations!  You got all the ships.")
  print("\n")
  print("Would you like to play again? Yes/No")
  let que = readLine()!

  if(que.uppercased() == "YES")
  {
    startGame()
  }
  else if(que.uppercased() == "NO")
  {
    print("Thank you for playing Command Line Battleship!")
  }
  
  
}
//================================================================


startGame()
