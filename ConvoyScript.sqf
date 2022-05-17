// see the transport script for some explanations
// For a convoy script ypu are better of using a mod like
// https://steamcommunity.com/sharedfiles/filedetails/?id=2801179774
_wp = ConvoyGroup addWaypoint [[1855.19,5780.92,0], 0];
// get all waypoits of a group
_waypoints = waypoints ConvoyGroup;
_index = _waypoints find _wp;
// current waypoint index of the group
_currentIndex = currentWaypoint ConvoyGroup;
// wait until the waypoint is completed
// https://community.bistudio.com/wiki/currentWaypoint
 while { (_index + 1) != _currentIndex} do 
{
_currentIndex = currentWaypoint ConvoyGroup;
 uiSleep 0.001;
};
// add units of the van to the convoyGroup
units ConvoyGroupVan join ConvoyGroup;
sleep 1;
units ConvoyGroupBack join ConvoyGroup;
sleep 10;
ConvoyGroup setFormation "FILE";
ConvoyGroup setSpeedMode "LIMITED";
// now that the joinig is completed we will set som parameters to the vechiles
_veh = [ConvoyGroup, true] call BIS_fnc_groupVehicles;
{ 
systemChat str _x;
_x limitSpeed 40;
// when having trouble with corners and curves up this number
_x setConvoySeparation 40;
// Turning ad the T intersection proves a problem when this is turend on
_x forceFollowRoad false;
} ForEach _veh;
sleep 1;
_wp = ConvoyGroup addWaypoint [[1764.43,5515.9,0], 0];

_camera = "camera" camCreate [0,0,0];
_camera cameraeffect ["internal", "back"];
_waypoints = waypoints ConvoyGroup;
_index = _waypoints find _wp;
_currentIndex = currentWaypoint ConvoyGroup;
while{((_index + 1) != _currentIndex) && alive _camera}do{
_currentIndex = currentWaypoint ConvoyGroup;
_camera camSetTarget ConvoyRearOfroad;
_camera camSetRelPos [0,-13,1.2];
_camera camCommit 0;
sleep 0.001;
};
// order squad to get in vechile
_wp = CovoyPassengerGroup addWaypoint [ConvoyVan,0];
_wp setWaypointType "GETIN";
_wp waypointAttachVehicle ConvoyVan;
// Check if they are in
_inVechile = [];
_units = units CovoyPassengerGroup;
// Here we create an array to keep track wich units are in the car
{ _inVechile append [false]} ForEach _units;
while { _inVechile find false != -1} do 
{
{
 if (_x in ConvoyVan) then 
 {
  _index = _units find _x;
  _inVechile set [_index, true];
 };
} ForEach _units;
 uiSleep 0.001;
};

_wp = ConvoyGroup addWaypoint [[2119.41,5645.22,0], 0];
_wp setWaypointType "TR UNLOAD";
_camera = "camera" camCreate [0,0,0];
_camera cameraeffect ["internal", "back"];
_waypoints = waypoints ConvoyGroup;
_index = _waypoints find _wp;
_currentIndex = currentWaypoint ConvoyGroup;
while{((_index + 1) != _currentIndex) && alive _camera}do{
_currentIndex = currentWaypoint ConvoyGroup;
_camera camSetTarget ConvoyRearOfroad;
_camera camSetRelPos [0,-13,1.2];
_camera camCommit 0;
sleep 0.001;
};
while{speed ConvoyVan > 0 }do{
sleep 0.001;
};
_wp = CovoyPassengerGroup addWaypoint [ConvoyVan, 0];
_wp setWaypointType "GETOUT";
_wp waypointAttachVehicle ConvoyVan;
_wp = CovoyPassengerGroup addWaypoint [[2179.7,5630.22,0], 0];
_waypoints = waypoints CovoyPassengerGroup;
_index = _waypoints find _wp;
_currentIndex = currentWaypoint CovoyPassengerGroup;
while{((_index + 1) != _currentIndex) && alive _camera}do{
_currentIndex = currentWaypoint CovoyPassengerGroup;
_camera camSetTarget leader CovoyPassengerGroup;
_camera camSetRelPos [0,-13,1.2];
_camera camCommit 0;
sleep 0.001;
};

if(alive _camera)then
{
sleep 1
};
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
setacctime 1;