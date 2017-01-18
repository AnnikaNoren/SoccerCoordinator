//Soccer Coordinator Challenge

//Dictionary of arrays to hold player data

var players2: [String: [String]] = [:]

//Player info with a generic parent name
players2["Joe Smith"] = ["42","YES","M & D"]
players2["Jill Tanner"] = ["36", "YES", "M & D"]
players2["Bill Bon"] = ["43", "YES", "M & D"]
players2["Eva Gordon"] = ["45", "NO", "M & D"]
players2["Matt Gill"] = ["40", "NO", "M & D"]
players2["Kimmy Stein"] = ["41", "NO", "M & D"]
players2["Sammy Adams"] = ["45", "NO", "M & D"]
players2["Karl Saygan"] = ["42", "YES", "M & D"]
players2["Sali Dali"] = ["41", "NO", "M & D"]
players2["Joe Kavalier"] = ["39", "NO", "M & D"]
players2["Ben Finkelstein"] = ["44", "NO", "M & D"]
players2["Diego Soto"] = ["41", "YES", "M & D"]
players2["Chloe Alaska"] = ["47", "NO", "M & D"]
players2["Arnold Willis"] = ["43", "NO", "M & D"]
players2["Philip Helm"] = ["44", "YES", "M & D"]
players2["Les Clay"] = ["42", "YES", "M & D"]
players2["Herschel Krustofski"] = ["45", "YES", "M & D"]
players2["Suzane Greenberg"] = ["44", "YES", "M & D"]


/*Iterate through all the players to create balanced teams based on experience (count number of experienced kids, divide by 3), assign them to Raptors, Dragons or Sharks */

//Arrays for team rosters
var dragonTeamRoster:[String] = []
var sharkTeamRoster:[String] = []
var raptorTeamRoster:[String] = []

//function to calculate the number of experienced players
func countNumberOfExperiencedPlayers() -> (Int) {
    var count = 0
    for (_, value) in players2 {
        if (value[1] == "YES"){
            count = count + 1
        }
    }
    //    print("There are \(count) experienced players and \(players2.count) total players. " +
    //    "Each team should have at least \(count/3) experienced players.")
    return(count)
}

//Calculate the total height of all players
var height = 0
for (_, value) in players2 {
    height = height + Int(value[0])!
}


//Variables to hold the number of experienced and inexperienced players per team, and total players per team
var experiencedPlayersPerTeam = (countNumberOfExperiencedPlayers()/3)
var playersPerTeam = (players2.count)/3
var inexperiencedPlayersPerTeam = playersPerTeam - experiencedPlayersPerTeam

//Counters
var experiencedShark = 0
var inexperiencedShark = 0
var totalShark = 0
var sharkHeight = 0

var experiencedRaptor = 0
var inexperiencedRaptor = 0
var totalRaptor = 0
var raptorHeight = 0

var experiencedDragon = 0
var inexperiencedDragon = 0
var totalDragon = 0
var dragonHeight = 0

//Place players on teams
for (key,value) in players2{
    //player has experience
    if (value[1] == "YES"){
        if (experiencedRaptor < experiencedPlayersPerTeam) && (totalRaptor <= playersPerTeam) {
            experiencedRaptor += 1
            totalRaptor += 1
            raptorHeight += Int(value[0])!
            raptorTeamRoster.append(key)
        } else if (experiencedDragon < experiencedPlayersPerTeam) && (totalDragon <= playersPerTeam){
            experiencedDragon += 1
            totalDragon += 1
            dragonHeight += Int(value[0])!
            dragonTeamRoster.append(key)
        } else {
            experiencedShark += 1
            totalShark += 1
            sharkHeight += Int(value[0])!
            sharkTeamRoster.append(key)
        }
        //Player has no experience
    } else {
        if (totalRaptor <= playersPerTeam) && (inexperiencedRaptor < inexperiencedPlayersPerTeam) {
            inexperiencedRaptor += 1
            totalRaptor += 1
            raptorHeight += Int(value[0])!
            raptorTeamRoster.append(key)
        } else if (totalDragon <= playersPerTeam) && (inexperiencedDragon < inexperiencedPlayersPerTeam) {
            inexperiencedDragon += 1
            totalDragon += 1
            dragonHeight += Int(value[0])!
            dragonTeamRoster.append(key)
        } else {
            inexperiencedShark += 1
            totalShark += 1
            sharkHeight += Int(value[0])!
            sharkTeamRoster.append(key)
        }
    }
}
print("The average raptor height is \(raptorHeight/playersPerTeam) inches")
print("The average dragon height is \(sharkHeight/playersPerTeam) inches")
print("The average shark height is \(dragonHeight/playersPerTeam) inches")



//writing letters

//create a set to hold letters

var letters = Set<String>()

//add personalized letters from the 3 rosters to Letters, print to console

for name in raptorTeamRoster{
    var parentInfo = players2[name]![2]
    letters.insert("Dear \(parentInfo), Your soccer player \(name) has been placed on the Raptor Soccer Team. Our first team practice will be held on March 18 at 1pm.")
}

for name in dragonTeamRoster{
    var parentInfo = players2[name]![2]
    letters.insert("Dear \(parentInfo), Your soccer player \(name) has been placed on the Dragon Soccer Team. Our first team practice will be held on March 17 at 3pm.")
}

for name in sharkTeamRoster{
    var parentInfo = players2[name]![2]
    letters.insert("Dear \(parentInfo), Your soccer player \(name) has been placed on the Shark Soccer Team. Our first team practice will be held on March 17 at 3pm.")
}

print(letters)
