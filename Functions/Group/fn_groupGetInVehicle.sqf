/*
	Author: Axel Huybrechts

	Description:
		Orders a group of soldiers to get in a vehicle. The same as a GetIn waypoint, this is the script version.

	Parameter(s):
		0: Group - (Required) the group that needs to get in a vehicle.
		1: Vehicle - (Required) The vehicle the group needs to get in.

	Returns:
		BOOLEAN - To signafy end of function

	Example:
		[PassengerGroup,OffroadOne] call BIS_fnc_groupGetInVehilce
*/

params [
["_group", grpNull, [grpNull]],
["_vehicle", objNull, [objNull]]
];

// https://community.bistudio.com/wiki/addWaypoint
_wp = _group addWaypoint [position _vehicle, 0];
// https://community.bistudio.com/wiki/setWaypointType
_wp setWaypointType "GETIN";
// when using get in you need to use this to attach to vechille
// https://community.bistudio.com/wiki/waypointAttachVehicle
_wp waypointAttachVehicle _vehicle;

// If you don't wait here the soldier wil keep running in the starting position
sleep 1;

true;