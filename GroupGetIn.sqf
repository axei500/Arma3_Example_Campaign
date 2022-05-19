_GroupToOrder = _this select 0;
_VehicleToGetIn = _this select 1;
// _wp saves the waypoint for furtur use
// PassengerGroup is the group of units like alpha 1-1 (thire var name)
// Postion gets the position of an object
// 0 is the radiuis so if it is 1 it wil place the waypoint in a circle of 1 around the center
// https://community.bistudio.com/wiki/addWaypoint
_wp = _GroupToOrder addWaypoint [position _VehicleToGetIn, 0];
// https://community.bistudio.com/wiki/setWaypointType
_wp setWaypointType "GETIN";
// when using get in you need to use this to attach to vechille
// https://community.bistudio.com/wiki/waypointAttachVehicle
_wp waypointAttachVehicle _VehicleToGetIn;