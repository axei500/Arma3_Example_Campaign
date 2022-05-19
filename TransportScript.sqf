// passeger one is the person/unit
// stand1 is one of the arma animations
// ASIS has to do with shown gear
// https://community.bistudio.com/wiki/BIS_fnc_ambientAnim
[PassengerOne, "STAND1", "ASIS"] call BIS_fnc_ambientAnim;

// Call a script that creates a waypoint for the soldiers to get in
// First var is the group, second is the vehicle
[PassengerGroup,OffroadOne] execVM "GroupGetIn.sqf";

// wait 5 seconds
// To see the animation
sleep 5;

// Cancel animation
passengerOne call BIS_fnc_ambientAnim__terminate;

// This script will check if a group is in a vehicle
waitUntil { private _allIn = [PassengerGroup,OffroadOne] Call TEST_fnc_groupInVehicle; !isNil "_allIn" && { _allIn } };
//waitUntil {([PassengerGroup,OffroadOne] Call TEST_fnc_groupInVehicle) == true };

// we give the passager a waypoint so he doesn't return to the cars start position
_wp = PassengerGroup addWaypoint [[1851.47,5623.78,0], 0];

// to get a set of cordinates go to eden editor and right click go to log and pres log cor to clipboard
_wp = OfroadOneDriverGroup addWaypoint [[1817.9,5623.82,0], 0];

// should unload all passgenrs
// Diced not to  do it this way because it doenst always work
//_wp setWaypointType "TR UNLOAD";

// Creates a camera with type camera, effectname interanl and effectPosition back
// _scriptHandler = ["camera","internal","back"] execVM "CreateCamera.sqf";

// waitUntil { scriptDone _scriptHandler };

// while the passeger is in the car and the camera is good
// while{PassengerOne in OffroadOne && alive _camera}do{
// https://community.bistudio.com/wiki/camSetTarget
// _camera camSetTarget OffroadOne;
// https://community.bistudio.com/wiki/camSetRelPos
// _camera camSetRelPos [0,-13,1.2];
// https://community.bistudio.com/wiki/camCommit
// _camera camCommit 0;
// sleep 0.001;
// };
// deleter camera when passgern gets out of car
// if(alive _camera)then
// {
// sleep 1
// };
// _camera cameraeffect ["terminate", "back"];
// camdestroy _camera;
// setacctime 1;