// passeger one is the person/unit
// stand1 is one of the arma animations
// ASIS has to do with shown gear
// https://community.bistudio.com/wiki/BIS_fnc_ambientAnim
[PassengerOne, "STAND1", "ASIS"] call BIS_fnc_ambientAnim;
// _wp saves the waypoint for furtur use
// PassengerGroup is the group of units like alpha 1-1 (thire var name)
// Postion gets the position of an object
// 0 is the radiuis so if it is 1 it wil place the waypoint in a circle of 1 around the center
// https://community.bistudio.com/wiki/addWaypoint
_wp = PassengerGroup addWaypoint [position OffroadOne, 0];
// https://community.bistudio.com/wiki/setWaypointType
_wp setWaypointType "GETIN";
// when using get in you need to use this to attach to vechille
// https://community.bistudio.com/wiki/waypointAttachVehicle
_wp waypointAttachVehicle OffroadOne;
// wait 5 seconds
sleep 5;
// Cancel animation
passengerOne call BIS_fnc_ambientAnim__terminate;
// create a boolean
_inVechile = false;
// wait until the soldier is in the vechile
// https://community.bistudio.com/wiki/while
while { not _inVechile} do 
{
// When the passagner is in the vechile
 if (PassengerOne in OffroadOne) then 
 {
  _inVechile = true;
  OffroadOne engineOn true;
 };
 uiSleep 0.001;
};
// we give the passager a waypoint so he doesn't return to the cars start position
_wp = PassengerGroup addWaypoint [[1851.47,5623.78,0], 0];
// to get a set of cordinates go to eden editor and right click go to log and pres log cor to clipboard
_wp = OfroadOneDriverGroup addWaypoint [[1817.9,5623.82,0], 0];
// should unload all passgenrs
_wp setWaypointType "TR UNLOAD";
// For te sake of not having to run after the car well set up a camera here
// found this here https://forums.bohemia.net/forums/topic/51591-camera-to-follow-a-rocket/
// https://community.bistudio.com/wiki/camCreate
_camera = "camera" camCreate [0,0,0];
// https://community.bistudio.com/wiki/cameraEffect
_camera cameraeffect ["internal", "back"];
// while the passeger is in the car and the camera is good
while{PassengerOne in OffroadOne && alive _camera}do{
// https://community.bistudio.com/wiki/camSetTarget
_camera camSetTarget OffroadOne;
// https://community.bistudio.com/wiki/camSetRelPos
_camera camSetRelPos [0,-13,1.2];
// https://community.bistudio.com/wiki/camCommit
_camera camCommit 0;
sleep 0.001;
};
// deleter camera when passgern gets out of car
if(alive _camera)then
{
sleep 1
};
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
setacctime 1;