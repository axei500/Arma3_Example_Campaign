/*
	Author: Axel Huybrechts

	Description:
		Checks if a group has completed a waypoint by cheking the current waypoint index. 

	Parameter(s):
		0: Group - (Required) the group that needs to get in a vehicle.
		1: Waypoint - (Required) The waypoint that has to be completed.

	Returns:
		BOOLEAN - Completed or not

	Example:
		[PassengerGroup,_wp] call BIS_fnc_groupWaypointCompleted
*/

params [
["_group", grpNull, [grpNull]],
["_waypoint", [], [[]],[2]]
];

_waypoints = waypoints _group;
_index = _waypoints find _waypoint;
_currentIndex = currentWaypoint _group;

_completed = false;

if((_index + 1) != _currentIndex) then {
	_completed = false;
} else {
	_completed = true;
};

_completed;