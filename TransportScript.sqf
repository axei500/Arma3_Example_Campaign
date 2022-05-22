// passeger one is the person/unit
// stand1 is one of the arma animations
// ASIS has to do with shown gear
// https://community.bistudio.com/wiki/BIS_fnc_ambientAnim
[PassengerOne, "STAND1", "ASIS"] call BIS_fnc_ambientAnim;

waitUntil { private _scriptCompleted = [PassengerGroup,OffroadOne] Call Group_fnc_groupGetInVehicle; !isNil "_scriptCompleted" && { _scriptCompleted } };

// Cancel animation
passengerOne call BIS_fnc_ambientAnim__terminate;

// This script will check if a group is in a vehicle
waitUntil { private _allIn = [PassengerGroup,OffroadOne] Call Group_fnc_groupInVehicle; !isNil "_allIn" && { _allIn } };
//waitUntil {([PassengerGroup,OffroadOne] Call TEST_fnc_groupInVehicle) == true };

// to get a set of cordinates go to eden editor and right click go to log and pres log cor to clipboard
_wp = OfroadOneDriverGroup addWaypoint [[1817.9,5623.82,0], 0];

 _camera = call Camera_fnc_cameraCreate;

// should unload all passgenrs
// Diced not to  do it this way because it doenst always work
//_wp setWaypointType "TR UNLOAD";
_vahicleInPosition = [OfroadOneDriverGroup,_wp] Call Group_fnc_groupWaypointCompleted;
// while not in posistion
while{!(_vahicleInPosition) && alive _camera}do{
[_camera,OffroadOne,[0,-13,1.2]] call Camera_fnc_cameraFollow;
_vahicleInPosition = [OfroadOneDriverGroup,_wp] Call Group_fnc_groupWaypointCompleted;
uiSleep 0.001;
};

// we give the passager a waypoint so he doesn't return to the cars start position
_wp = PassengerGroup addWaypoint [[1851.47,5623.78,0], 0];
// If you dont do this the soldiers wil get back in the car
units PassengerGroup allowGetIn false;
// Order the troops to disambark
doGetOut units PassengerGroup;


_soldiersInPosition = [PassengerGroup,_wp] Call Group_fnc_groupWaypointCompleted;
while{!(_soldiersInPosition) && alive _camera} do {
[_camera,leader PassengerGroup,[0,-13,1.2]] call Camera_fnc_cameraFollow;
_soldiersInPosition = [PassengerGroup,_wp] Call Group_fnc_groupWaypointCompleted;
uiSleep 0.001;
};

//deleter camera when passgern gets out of car
if(alive _camera)then
{
sleep 1
};

[_camera] call Camera_fnc_cameraDestroy;
