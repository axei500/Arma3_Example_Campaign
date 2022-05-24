/*
	Author: Axel Huybrechts

	Description:
		Make a squad get out of a vehicle, and head to a location

	Parameter(s):
		0: Group - group that needs to get out of the vehicle
		1: Location(array numbers) - where the group goes after exeting

	Returns:
		returns true to signafy end

	Example:
		[convoy_group,[0,0,0]] call Group_fnc_groupGetOut;
*/

params [
["_group", grpNull, [grpNull]],
["_location", [0,0,0], [[1]],[3]]
];

// we give the passager a waypoint so he doesn't return to the cars start position
_wp = _group addWaypoint [_location, 0];
// If you dont do this the soldiers wil get back in the car
units _group allowGetIn false;
// Order the troops to disambark
doGetOut units _group;

true;