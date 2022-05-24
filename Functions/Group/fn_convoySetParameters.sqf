/*
	Author: Axel Huybrechts

	Description:
		Sets vehicle follow parametes for groups with vehicles

	Parameter(s):
		0: Group - the convoy group
		1: SeperationDistance(Number) - How far apart the vehicles have to be from each other in meters
		2: Speed(Number) - The speed at wich the vehicles will move

	Returns:
		returns true to signafy end

	Example:
		[convoy_group,10,10,true] call BIS_fnc_convoySetParameters
*/

params [
["_group", grpNull, [grpNull]],
["_seperationDistance", 10, [0]],
["_speed", 0, [0]],
["_useRoads",false,[true]]
];

_veh = [_group, true] call BIS_fnc_groupVehicles;
{ 
	_x limitSpeed _speed;
	//when having trouble with corners and curves up this number
	_x setConvoySeparation _seperationDistance;
	//Turning ad the T intersection proves a problem when this is turend on
	_x forceFollowRoad _useRoads;
} ForEach _veh;

true;